class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :orders
  has_many :carts
  has_many :items, through: :carts

  validates :name, length: { minimum: 3}
  validates :price, presence: true
  validates :quantity, inclusion: 1..99

  def price_formatted
    "#{sprintf("%.2f", price)}"
  end

end
