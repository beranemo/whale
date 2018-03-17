class AddDiscountMethodCodeToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :discount_method_code, :string
  end
end
