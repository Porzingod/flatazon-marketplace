class Address < ApplicationRecord
  belongs_to :user

  validates :street_address_1, :street_address_2, :city, :state, presence: true
  validates :zipcode, length: {is: 5}
end
