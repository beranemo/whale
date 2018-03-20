# == Schema Information
#
# Table name: discounts
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  bulletin_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  discount_method_id :integer
#  discount_price     :integer
#

require 'test_helper'

class DiscountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
