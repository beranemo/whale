class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :user_id
      t.integer :amount
      t.string :address
      t.string :payment_method
      t.timestamps
    end
  end
end
