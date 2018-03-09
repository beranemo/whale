class AddPaymentAndTypeToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :payment, :string
    add_column :guests, :type, :string, null: false, default: ""
  end
end
