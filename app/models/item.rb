class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :carts
  has_many :items, through: :carts

  validates :name, length: { minimum: 3}
  validates :price, presence: true
  validates :quantity, inclusion: 1..99

  mount_uploader :image, ImageUploader

  def price_formatted
    "#{sprintf("%.2f", price)}"
  end

  def self.search(term)
    if term
      t = term.downcase.chomp
      if self.all.select{|item| item.category.name.downcase.include? (t)}.empty?
        self.all.select{|item| item.name.downcase.include? (t)}
      else
        self.all.select{|item| item.category.name.downcase.include? (t)}
      end
    else
      self.all
    end
  end

end
