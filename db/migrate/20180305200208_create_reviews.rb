class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
