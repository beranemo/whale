class AddColumnsToAges < ActiveRecord::Migration[5.1]
  def change
    add_column :ages, :note, :string
    add_column :ages, :system_flag, :string
  end
end
