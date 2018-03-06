class User < ApplicationRecord
  has_secure_password

  # has_many :items
  has_many :reviews
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :username, :email, uniqueness: true
  serialize :cart, Array

  def add_to_cart(item)
    self.cart << item
  end

  def cart_total
    self.cart.reduce(0) {|sum, item| sum + item.price}
  end
end
