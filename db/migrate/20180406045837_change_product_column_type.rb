class ChangeProductColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :zh_m_ingredients, :text
    change_column :products, :zh_ingredients, :text
    change_column :products, :en_ingredients, :text
  end
end
