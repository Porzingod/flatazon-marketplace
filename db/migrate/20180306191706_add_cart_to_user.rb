class AddCartToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cart, :string, array: true, default: [].to_yaml
  end
end
