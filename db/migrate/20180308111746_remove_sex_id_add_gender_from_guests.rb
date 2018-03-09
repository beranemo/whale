class RemoveSexIdAddGenderFromGuests < ActiveRecord::Migration[5.1]
  def change
    remove_column :guests, :sex_id
    add_column :guests, :gender, :string, null: false, default: ""
  end
end
