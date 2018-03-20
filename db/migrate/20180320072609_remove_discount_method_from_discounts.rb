class RemoveDiscountMethodFromDiscounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :discounts, :discount_method
  end
end
