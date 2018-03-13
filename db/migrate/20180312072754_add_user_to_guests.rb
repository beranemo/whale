class AddUserToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :user_id, :integer
  end
end
