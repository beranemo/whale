class CreateSexes < ActiveRecord::Migration[5.1]
  def change
    create_table :sexes do |t|
      t.string :gender

      t.timestamps

      add_column :guests, :sex_id, :integer
    end
  end
end
