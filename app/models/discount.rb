# == Schema Information
#
# Table name: discounts
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  bulletin_id        :integer
#  discount_method    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  discount_method_id :integer
#

class Discount < ApplicationRecord
  belongs_to :product
  belongs_to :bulletin
end
