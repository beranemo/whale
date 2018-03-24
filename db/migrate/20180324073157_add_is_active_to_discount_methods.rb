class AddIsActiveToDiscountMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :discount_methods, :is_active, :boolean, default: true
  end
end
