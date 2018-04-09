class AddOrderItemsIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :order_items, :order_id
    add_index :order_items, :product_id
  end
end
