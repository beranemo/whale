class CreateGuestTypesAndAgesTableAndRenameFromGuestsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :ages do |t|
      t.string :age_type
      t.timestamps
    end

    create_table :guest_types do |t|
      t.string :guest_type
      t.timestamps
    end
    rename_column :guests, :age, :age_id
    rename_column :guests, :guest_type, :guest_type_id
    rename_column :countries, :nat, :country_type
  end
end
