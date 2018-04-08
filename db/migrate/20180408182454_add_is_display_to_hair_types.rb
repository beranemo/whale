class AddIsDisplayToHairTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :hair_types, :is_display, :boolean, default: true
  end
end
