class AddMemberEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :email, :string,null: false, default: ""
  end
end
