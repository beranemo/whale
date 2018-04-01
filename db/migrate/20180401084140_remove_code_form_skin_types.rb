class RemoveCodeFormSkinTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :skin_types, :code
    remove_column :skin_types, :skin_type
  end
end
