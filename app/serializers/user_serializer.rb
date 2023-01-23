class UserSerializer < ActiveModel::Serializer
  attributes :id , :email ,:name ,:username
  has_many :posts
end
