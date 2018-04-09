# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy  

  def get_coupons(coupon)
    @cart_coupons = self.cart_items.where('product_id = ?', coupon.id)
    @coupon_discount = 0
    @cart_coupons.each do |c|
      @coupon_discount += c.discount_off
    end
    @coupon_discount
  end
end
