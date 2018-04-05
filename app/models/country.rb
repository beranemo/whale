# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  country_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_active    :boolean          default(TRUE)
#  name_zh_tw   :string
#  name_en_us   :string
#  code         :string
#  system_flag  :string
#

class Country < ApplicationRecord
  has_many :guests
  
  scope :in_service, -> { where(is_active: true).order(system_flag: :asc) }
end
