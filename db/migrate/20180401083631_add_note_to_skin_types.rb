class AddNoteToSkinTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :skin_types, :note, :string
  end
end
