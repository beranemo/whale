class RemoveCodeFromHairTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :hair_types, :code
  end
end
