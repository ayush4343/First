class SellersController < ApplicationController
  def index
    @sellers = Seller.all
  end

  def show 
    @seller = Seller.find(params[:id])
  end

  def new 
    @seller  = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
      if @seller.save 
      redirect_to @seller
   end
  end


  def seller_params
    params.require(:seller).permit(:name, :personal_email, :aadhar_no, :contact_no, :pincode, :city, :state, :country, :address)
  end
end

