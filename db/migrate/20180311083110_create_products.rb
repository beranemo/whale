class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string      :category
      t.string      :zh_name
      t.string      :en_name
      t.string      :capacity
      t.integer     :price
      t.string      :upc
      t.string      :use_for
      t.string      :directions
      t.string      :zh_m_ingredients
      t.string      :zh_ingredients
      t.string      :en_ingredients
      t.integer     :quantity, default: 0
      t.string      :status

      t.timestamps
    end
  end
end
