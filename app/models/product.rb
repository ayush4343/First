class Product < ApplicationRecord
	has_one_attached :photo
	belongs_to :user


	enum category_type: [:automobile ,:grocery ,:gadgets ,:bags ,:oil, :electric]
end

