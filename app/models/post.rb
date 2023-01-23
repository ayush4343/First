class Post < ApplicationRecord
  belongs_to :user


  validates :name, presence: true 
  validates :text , presence: true
  
end
