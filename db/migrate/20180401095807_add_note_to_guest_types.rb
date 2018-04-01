class AddNoteToGuestTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :guest_types, :note, :string
  end
end
