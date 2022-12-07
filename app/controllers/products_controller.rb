class ProductsController < ApplicationController
load_and_authorize_resource

def index
  # byebug
  @products = Product.accessible_by(current_ability)
  #@group = @products.group(:category_type)
  category =  @products.group(:category_type).count.keys
  

 @category_with_product = Hash.new
 # byebug
    category.each do |category|
    # byebug
    @category_with_product[category] = @products.where(category_type: category)
    # byebug
 end
  # @category_type = @products.category_types
  # if current_user.role == "customer"
  #   @products = Product.all
  # end

  # byebug
  # if current_user.role == "seller"
  #   @products = Product.where(user_id: current_user)
  # end

end


  def show
    @product = Product.find(params[:id])
   
  end

  def new
    @product = Product.new
  end

def create
    @product  = Product.new(product_params.merge(user_id: current_user.id))
    if @product.save
    redirect_to @product
    else
    render :new
  end
end


 def edit
     @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to  @product
    else
      render :edit
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      
    redirect_to products_path

   end



private

  def product_params
   params.require(:product).permit(:name,:soap_type,:mfg_date,:exp_date,:photo,:user_id,:category_type)
  end



end













































# @product  = Product.new(product_params.merge(seller_id: current_user.id))