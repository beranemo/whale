class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name, null: false, default: ""
      t.date :birthday, null: false
      t.string :gender, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :skin
      t.string :hair
      t.string :avatar
      t.string :remark
      t.timestamps
    end
  end
end
