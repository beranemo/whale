class AddDiscountToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :discount_off, :integer
    add_column :order_items, :discount_method_code, :string
  end
end
