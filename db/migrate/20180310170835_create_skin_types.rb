class CreateSkinTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :skin_types do |t|
      t.string :skin_type

      t.timestamps
    end
  end
end
