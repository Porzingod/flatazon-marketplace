class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.belongs_to :user
      t.belongs_to :item
      t.timestamps
    end
  end
end
