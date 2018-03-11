class ChangeColumnInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :directions, :text
  end
end
