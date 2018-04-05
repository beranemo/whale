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
end
