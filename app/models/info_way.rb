# == Schema Information
#
# Table name: info_ways
#
#  id           :integer          not null, primary key
#  news_channel :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  note         :string
#  system_flag  :string
#  is_display   :boolean          default(TRUE)
#

class InfoWay < ApplicationRecord
  has_many :guests
  scope :display, -> { where(is_display: true).order(system_flag: :asc) }
end
