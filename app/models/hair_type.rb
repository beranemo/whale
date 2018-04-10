# == Schema Information
#
# Table name: hair_types
#
#  id          :integer          not null, primary key
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#  is_display  :boolean          default(TRUE)
#

class HairType < ApplicationRecord
  has_many :members
  scope :display, -> { where(is_display: true).order(system_flag: :asc) }
end
