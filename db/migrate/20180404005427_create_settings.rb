class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :code
      t.string :content

      t.timestamps
    end
  end
end
