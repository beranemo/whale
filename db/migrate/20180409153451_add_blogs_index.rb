class AddBlogsIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :blogs, :user_id
    add_index :blogs, :published_at
  end
end
