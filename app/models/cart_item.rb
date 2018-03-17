# == Schema Information
#
# Table name: cart_items
#
#  id                   :integer          not null, primary key
#  cart_id              :integer
#  product_id           :integer          not null
#  quantity             :integer          default(1)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  discount_method_id   :integer
#  discount_method_code :string
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product 
  belongs_to :discount_method, foreign_key: "discount_method_code", primary_key: "code", :optional => true

  def calculate
    if discount_method.content == "第二件半價"
      product.price*(quantity/2)*1.5+product.price*(quantity%2)
    elsif discount_method.content == "九折"
      product.price*quantity*0.9
    elsif discount_method.content == "八折"
      product.price*quantity*0.8
    elsif discount_method.content == "七折"
      product.price*quantity*0.7
    elsif discount_method.content == "六折"
      product.price*quantity*0.6
    elsif discount_method.content == "五折"
      product.price*quantity*0.5
    else
      product.price*quantity
    end
  end
end
