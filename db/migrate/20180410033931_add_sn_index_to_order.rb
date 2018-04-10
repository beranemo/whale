class AddSnIndexToOrder < ActiveRecord::Migration[5.1]
  def change
    add_index :orders, :sn, unique: true
  end
end
