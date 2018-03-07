class Order < ApplicationRecord
  belongs_to :user

  def date_formatted
    self.order_date.strftime("%m/%d/%Y -- %I:%M%p")
  end

  def item_price_formatted
    "#{sprintf("%.2f", item_price)}"
  end
end
