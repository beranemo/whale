class CreateInfoWays < ActiveRecord::Migration[5.1]
  def change
    create_table :info_ways do |t|
      t.string :news_channel
      t.timestamps
    end
    add_column :guests, :info_way_id, :integer
  end
end
