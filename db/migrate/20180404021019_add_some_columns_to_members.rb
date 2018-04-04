class AddSomeColumnsToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :hair_type_id, :integer
    add_column :members, :member_type_id, :integer
  end
end
