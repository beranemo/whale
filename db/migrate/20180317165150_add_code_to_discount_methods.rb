class AddCodeToDiscountMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :discount_methods, :code, :string
  end
end
