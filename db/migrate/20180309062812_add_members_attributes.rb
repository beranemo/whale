class AddMembersAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :fax, :string
    add_column :members, :password, :string
    add_column :members, :group, :string
    add_column :members, :zip, :string
    add_column :members, :county, :string
    add_column :members, :address, :string
    add_column :members, :bonus, :integer, default: 0

  end
end
