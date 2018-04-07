class RemoveUnuseColumnInMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :skin
    remove_column :members, :hair
    remove_column :members, :hair_code
    remove_column :members, :hair_id
    remove_column :members, :group
    remove_column :members, :member_code
  end
end
