class AddDiscountMethodIdToCartItem < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :discount_method_id, :integer
  end
end
