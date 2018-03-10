class ChangeMembersAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :skin, :integer
    change_column :members, :hair, :integer
    rename_column :members, :skin, :skin_id
    rename_column :members, :hair, :hair_id
  end
end
