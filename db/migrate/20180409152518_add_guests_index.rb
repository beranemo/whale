class AddGuestsIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :guests, :created_at
    add_index :guests, :country_id
    add_index :guests, :info_way_id
    add_index :guests, :guest_type_id
    add_index :guests, :age_id
    add_index :guests, :user_id
  end
end
