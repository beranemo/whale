class AddGuestIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :guest_id, :integer
  end
end
