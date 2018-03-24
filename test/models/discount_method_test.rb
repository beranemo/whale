# == Schema Information
#
# Table name: discount_methods
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#  is_active  :boolean          default(TRUE)
#

require 'test_helper'

class DiscountMethodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
