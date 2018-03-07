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

  def show_orders
    order_dates = []
    user_orders = []
    self.orders.each do |order|
      if order_dates.include? (order.order_date)
        next
      else
        order_dates << order.order_date
      end
    end
    order_dates.each do |date|
      orders_from_date = self.orders.select{|order| order.order_date == date}
      user_orders << orders_from_date
    end
    user_orders
  end

  def order_totals
    show_orders.map do |order_group|
      order_group.reduce(0) do |sum, order|
        sum + order.item_price
      end
    end
  end



end
