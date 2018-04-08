class AddIsDisplayToInfoways < ActiveRecord::Migration[5.1]
  def change
    add_column :info_ways, :is_display, :boolean, default: true
  end
end
