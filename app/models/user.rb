class User < ApplicationRecord
  serialize :cart
  has_secure_password

  # has_many :items
  has_many :reviews
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :username, :email, uniqueness: true

  def add_to_cart(item)
    self.cart << item
  end

end
