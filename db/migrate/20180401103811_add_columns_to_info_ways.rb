class AddColumnsToInfoWays < ActiveRecord::Migration[5.1]
  def change
    add_column :info_ways, :note, :string
    add_column :info_ways, :system_flag, :string
  end
end
