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
#  zh_m_ingredients :string
#  zh_ingredients   :string
#  en_ingredients   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ApplicationRecord
end
