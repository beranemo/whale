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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  belongs_to :member
end
