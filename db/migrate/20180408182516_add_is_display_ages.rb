class AddIsDisplayAges < ActiveRecord::Migration[5.1]
  def change
    add_column :ages, :is_display, :boolean, default: true
  end
end
