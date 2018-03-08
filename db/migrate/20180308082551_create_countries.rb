class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :nat

      t.timestamps

      add_column :guests, :country_id, :integer
    end
  end
end
