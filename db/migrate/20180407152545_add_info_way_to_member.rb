class AddInfoWayToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :info_way_id, :integer
  end
end
