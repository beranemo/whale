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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
