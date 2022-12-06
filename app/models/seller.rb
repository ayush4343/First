class Seller < ApplicationRecord

	
	# validates :name, :aadhar_no,:contact_no,:pincode,:city,:state,:country,:address , presence: true
	# validates :personal_email,  uniqueness: true,presence: true
	# validates :contact_no , length: { is: 5}
	# validates :pincode, length: { is: 5}
	# validates :aadhar_no, length: { is: 5}

	enum status: [:pending , :approved]

end
