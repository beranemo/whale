# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  member_id      :integer
#  user_id        :integer
#  amount         :integer
#  address        :string
#  payment_method :string
#  name           :string
#  phone          :string
#  remark         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  discount_off   :integer
#  status         :boolean
#  sn             :integer
#  guest_id       :integer
#

class Order < ApplicationRecord
  validates_presence_of :member_id, :payment_method, :address
  validates :sn, uniqueness: true
  has_many :order_items, dependent: :destroy
  has_many :order_products, through: :order_items, source: :product
  belongs_to :user
  belongs_to :guest, optional: true
  belongs_to :member, optional: true

  def setup_sn!
    today = Date.today.to_s
    today.slice!("2")
    today_order_count = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).count
    self.sn = today.tr('-','').to_i * 1000 + today_order_count + 1
  end

  def setup_order_items!(current_cart)
    current_cart.cart_items.each do |item|
      product = item.product
      if product.zh_name != "折價卷" && self.status && self.address == "自取"
        product.minus_by_order(self,item.quantity)
      end

      order_item = self.order_items.build(product_id: item.product.id,
                                          price: item.calculate,
                                          quantity: item.quantity,
                                          discount_off: item.discount_off,
                                          discount_method_code: item.discount_method_code)
      order_item.save!
      product.save!
    end
  end

  

  def set_cart_items(cart)
    cart.cart_items.destroy_all
    order_items.each do |item|
      @cart_item = cart.cart_items.build(product_id: item.product.id, quantity: item.quantity)
      @cart_item.discount_off = item.discount_off
      @cart_item.discount_method_code = item.discount_method_code
      @cart_item.save!
    end
  end

  def generate_guest(user)
    @guest = Guest.create(age_id: self.member.find_age_type,
                          gender: self.member.gender,
                          guest_type_id: GuestType.find_by(guest_type: "舊客").id,
                          info_way_id: self.member.info_way_id,
                          country_id: Country.find_by(code: "TW").id,
                          user_id: user.id,
                          payment: self.amount,
                          )

    self.guest_id = @guest.id
    self.save!
  end
end
