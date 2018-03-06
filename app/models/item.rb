class Item < ApplicationRecord
  has_many :carts
  has_many :users, through: :carts
  belongs_to :category
  has_many :reviews

  validates :name, length: { minimum: 3}
  validates :price, presence: true
  validates :quantity, inclusion: 1..99

  def price_formatted
    "$#{sprintf("%.2f", price)}"
  end

end
