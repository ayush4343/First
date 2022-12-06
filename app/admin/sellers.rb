ActiveAdmin.register Seller do

  permit_params :name, :personal_email, :aadhar_no, :contact_no, :pincode, :city, :state, :country, :address, :status

form do |f| 
  f.inputs do
    f.input :name
    f.input :personal_email
    f.input :aadhar_no
    f.input :contact_no
    f.input :pincode
    f.input :city
    f.input :state
    f.input :country, as: :string
    f.input :address
    f.input :status
  end
  f.actions
end



controller do 

  def update
# byebug
   @seller = Seller.find(params[:id])
   if @seller.status != "approved"
         if params["seller"]["status"] == "approved"
            @user = User.new(email: @seller.personal_email, password:"seller@123456", password_confirmation:"seller@123456",role: 1)
              if @user.save
                 SellerMailer.with(seller: @seller).approved_seller.deliver_now
                 respond_to do |format|
                 format.html { redirect_to  admin_seller_path }
                  end
               else
                  flash[:notice] = "user hasn't created !"
              end
          end
   else
       respond_to do |format|
          format.html { 
           flash[:notice] = "status already approved"
           render :edit
         }
        end
   end 
 end




    def seller_params
      params.require(:seller).permit(:name, :personal_email,:aadhar_no,:contact_no,:pincode,:city,:state,:country,:address,:status)
    end

 end
end


