class AddProductsIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :products, :upc
  end
end
