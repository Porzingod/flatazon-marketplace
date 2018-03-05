class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :address_type
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
