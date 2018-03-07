class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.belongs_to :category
      t.belongs_to :user
      t.string :description

      t.timestamps
    end
  end
end
