class AddRemarkToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :remark, :string
  end
end
