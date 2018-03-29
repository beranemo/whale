class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :weather
      t.string :content
      t.integer :user_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
