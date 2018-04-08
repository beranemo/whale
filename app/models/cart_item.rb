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
#  discount_off         :integer
#  discount_method_code :string
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product 
  belongs_to :discount_method, foreign_key: "discount_method_code", primary_key: "code", :optional => true

  def calculate
    if discount_method.content == "第二件半價"
      product.price * (quantity / 2) * 1.5 + product.price * (quantity % 2)
    elsif discount_method.content == "打折"
      product.price * quantity * discount_off / 100
    elsif discount_method.content == "贈品"
      0
    elsif discount_method.content == "優惠價"
      discount_off
    else
      product.price * quantity
    end
  end

  def origin_calculate
    product.price * quantity
  end
end
