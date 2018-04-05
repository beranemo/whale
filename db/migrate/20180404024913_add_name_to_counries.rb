class AddNameToCounries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :name_zh_tw, :string
    add_column :countries, :name_en_us, :string
    add_column :countries, :code, :string
  end
end
