class AddLabelToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :label, :string
  end
end
