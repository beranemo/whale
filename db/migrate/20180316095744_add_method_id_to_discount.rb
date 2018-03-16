class AddMethodIdToDiscount < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :discount_method_id, :integer
  end
end
