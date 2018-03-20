class RenameDiscountMethodIdInCartItem < ActiveRecord::Migration[5.1]
  def change
    rename_column :cart_items, :discount_method_id, :discount_off
  end
end
