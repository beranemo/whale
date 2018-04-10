# == Schema Information
#
# Table name: guest_types
#
#  id          :integer          not null, primary key
#  guest_type  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#  system_flag :string
#  is_display  :boolean          default(TRUE)
#  code        :string
#

class GuestType < ApplicationRecord
  has_many :guests
  
  scope :display, -> { where(is_display: true).order(system_flag: :asc) }
end
