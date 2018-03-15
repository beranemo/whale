class CreateMemberTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :member_types do |t|
      t.string :code
      t.string :value
      t.string :system_flag, :default => "N"

      t.timestamps
    end
  end
end
