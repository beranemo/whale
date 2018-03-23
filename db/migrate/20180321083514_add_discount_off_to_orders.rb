class AddDiscountOffToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :discount_off, :integer
  end
end
