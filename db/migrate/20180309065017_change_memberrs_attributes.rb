class ChangeMemberrsAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :skin_id, :integer
    add_column :members, :hair_id, :integer
  end
end
