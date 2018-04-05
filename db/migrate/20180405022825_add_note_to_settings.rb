class AddNoteToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :note, :string
  end
end
