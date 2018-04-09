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

class StockRecord < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
end
