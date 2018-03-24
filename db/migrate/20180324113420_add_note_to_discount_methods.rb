class AddNoteToDiscountMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :discount_methods, :note, :string
  end
end
