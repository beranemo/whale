class AddIsActiveToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :is_active, :boolean, default: false
  end
end
