class RemoveCodeFromMemberTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :member_types, :code
  end
end
