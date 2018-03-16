# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer          not null
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product 

  def calculate
    if product.discount.discount_method == "第二件半價"
      product.price*(quantity/2)*1.5+product.price*(quantity%2)
    else
      product.price*quantity
    end
  end
end
