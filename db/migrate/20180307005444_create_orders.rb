class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.belongs_to :user
      t.string :item_name
      t.integer :item_price
      t.integer :item_quantity, default: 1
      t.timestamps
    end
  end
end
