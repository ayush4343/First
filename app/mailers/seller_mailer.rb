class SellerMailer < ApplicationMailer
	
	def approved_seller
		
		@seller = params[:seller]
		mail(to: @seller.personal_email , subject:"admin has approved your request")
	end

end
