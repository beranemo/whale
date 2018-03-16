class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.integer :product_id
      t.integer :bulletin_id
      t.string :discount_method
      t.timestamps
    end
  end
end
