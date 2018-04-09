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
  has_many :order_items, dependent: :destroy
  belongs_to :user
  validates_presence_of :member_id, :payment_method, :address
  has_many :order_products, through: :order_items, source: :product
  belongs_to :guest, optional: true
  belongs_to :member, optional: true

  def setup_sn!
    today = Date.today.to_s
    today.slice!("2")
    today_order_count = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).count
    self.sn = today.tr('-','').to_i * 1000 + today_order_count + 1
  end
end
