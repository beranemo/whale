class RenameTypeToGuestTypeFromGuests < ActiveRecord::Migration[5.1]
  def change
    rename_column :guests, :type, :guest_type
  end
end
