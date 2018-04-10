# == Schema Information
#
# Table name: ages
#
#  id          :integer          not null, primary key
#  age_type    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#  system_flag :string
#  is_display  :boolean          default(TRUE)
#

class Age < ApplicationRecord
  has_many :guests
  scope :display, -> { where(is_display: true).order(system_flag: :asc) }
end
