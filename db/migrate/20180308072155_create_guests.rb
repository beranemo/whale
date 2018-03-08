class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string "age"

      t.timestamps
    end
  end
end
