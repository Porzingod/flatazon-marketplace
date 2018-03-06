class Item < ApplicationRecord
  # has_many :users, through: :carts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user
  belongs_to :category
  has_many :reviews

  validates :name, length: { minimum: 3}
  validates :price, presence: true
  validates :quantity, inclusion: 1..99

  def price_formatted
    "$#{sprintf("%.2f", price)}"
  end

  def category_id=(category_id)
    self.category = Category.find(category_id)
  end

  def category_id
    self.category&.name
  end

end
