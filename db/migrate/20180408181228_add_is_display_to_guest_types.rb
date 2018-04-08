class AddIsDisplayToGuestTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :guest_types, :is_display, :boolean, default: true
  end
end
