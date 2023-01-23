class User < ApplicationRecord
  has_secure_password
  
  validates :name , presence: true 
  validates :email, presence: true
  validates :username, presence: true
  validates :password , presence: true

 

  has_many :posts


has_many :followed_users , foreign_key: :follower_id , class_name: "Follow"
has_many :followees , through: :followed_users 
has_many :following_users , foreign_key: :followee_id , class_name: "Follow"
has_many :followers , through: :following_users 




end
  