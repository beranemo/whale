class CreateHairTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :hair_types do |t|
      t.string :code
      t.string :value
      t.string :system_flag, :default => "N"
      
      t.timestamps
    end
  end
end
