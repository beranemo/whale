class AddNoteToHairTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :hair_types, :note, :string
  end
end
