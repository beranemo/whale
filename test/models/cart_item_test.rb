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

require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
