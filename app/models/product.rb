class Product < ApplicationRecord
	has_one_attached :photo
	belongs_to :user


	enum category_type: [:Automobile ,:Grocery ,:Gadgets ,:Bags ,:Oil, :Electric]
end

