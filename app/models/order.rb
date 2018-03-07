class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def date_formatted
    self.order_date.strftime("%m/%d/%Y -- %I:%M%p")
  end
end
