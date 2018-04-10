# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  category         :string
#  zh_name          :string
#  en_name          :string
#  capacity         :string
#  price            :integer
#  upc              :string
#  use_for          :string
#  directions       :text
#  zh_m_ingredients :text
#  zh_ingredients   :text
#  en_ingredients   :text
#  quantity         :integer          default(0)
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
