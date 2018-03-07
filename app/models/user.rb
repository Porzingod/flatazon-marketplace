class User < ApplicationRecord
  has_secure_password

  has_many :orders
  has_many :carts
  has_many :items
  has_many :reviews
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :username, :email, uniqueness: true

  def cart
    Cart.all.select {|cart| cart.user == self}
  end

  def add_to_cart(item)
    self.items << item
  end

  def format_money(money)
    "#{sprintf("%.2f", money)}"
  end

  def format_balance
    format_money(self.balance)
  end

  def cart_total
    price = self.cart.reduce(0) {|sum, cart| sum + cart.item.price}
    format_money(price)
  end
end
