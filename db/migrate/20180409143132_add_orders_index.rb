class AddOrdersIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :orders, :member_id
    add_index :orders, :user_id
    add_index :orders, :guest_id
    add_index :orders, :created_at
    add_index :orders, :status
  end
end
