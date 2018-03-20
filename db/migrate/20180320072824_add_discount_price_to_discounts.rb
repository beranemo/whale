class AddDiscountPriceToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :discount_price, :integer
  end
end
