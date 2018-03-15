class CreateStockRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_records do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.timestamps
    end
  end
end
