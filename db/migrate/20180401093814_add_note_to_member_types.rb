class AddNoteToMemberTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :member_types, :note, :string
  end
end
