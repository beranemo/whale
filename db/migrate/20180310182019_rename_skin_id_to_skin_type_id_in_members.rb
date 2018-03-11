class RenameSkinIdToSkinTypeIdInMembers < ActiveRecord::Migration[5.1]
  def change
    rename_column :members, :skin_id, :skin_type_id
  end
end
