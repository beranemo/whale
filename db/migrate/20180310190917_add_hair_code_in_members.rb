class AddHairCodeInMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :hair_code, :string
  end
end
