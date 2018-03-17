# == Schema Information
#
# Table name: stock_records
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StockRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
