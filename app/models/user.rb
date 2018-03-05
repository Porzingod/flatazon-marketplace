class User < ApplicationRecord
  has_secure_password

  has_many :carts
  has_many :items, through: :carts
  has_many :reviews
  has_many :addresses

  validates :username, :email, uniqueness: true
end
