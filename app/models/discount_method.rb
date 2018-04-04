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
#  note       :string
#

class DiscountMethod < ApplicationRecord
  has_many :cart_items, foreign_key: "discount_method_code", primary_key: "code"
  
  scope :in_service, -> { where(is_active: true) }
end
