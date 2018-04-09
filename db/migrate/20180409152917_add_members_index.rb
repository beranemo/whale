class AddMembersIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :members, :skin_type_id
    add_index :members, :hair_type_id
    add_index :members, :member_type_id
    add_index :members, :info_way_id
    add_index :members, :phone
  end
end
