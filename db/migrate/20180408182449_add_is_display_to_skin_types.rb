class AddIsDisplayToSkinTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :skin_types, :is_display, :boolean, default: true
  end
end
