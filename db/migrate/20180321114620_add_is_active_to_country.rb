class AddIsActiveToCountry < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :is_active, :boolean, default: true
  end
end
