class AddIsDisplayToMemberTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :member_types, :is_display, :boolean, default: true
  end
end
