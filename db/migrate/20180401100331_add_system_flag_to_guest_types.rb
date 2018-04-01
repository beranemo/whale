class AddSystemFlagToGuestTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :guest_types, :system_flag, :string
  end
end
