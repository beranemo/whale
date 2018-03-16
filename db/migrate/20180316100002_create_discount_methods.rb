class CreateDiscountMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_methods do |t|
      t.string :content
      t.timestamps
    end
  end
end
