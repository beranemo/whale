class CreateBulletins < ActiveRecord::Migration[5.1]
  def change
    create_table :bulletins do |t|
      t.string  :title
      t.text    :content
      t.integer :user_id
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end
  end
end
