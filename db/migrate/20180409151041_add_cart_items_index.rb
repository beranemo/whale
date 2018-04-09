class AddCartItemsIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :cart_items, :product_id
    add_index :cart_items, :cart_id
    add_index :cart_items, :discount_method_code
  end
end
