class AddFlagToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :system_flag, :string
  end
end
