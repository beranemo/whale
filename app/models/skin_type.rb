# == Schema Information
#
# Table name: skin_types
#
#  id          :integer          not null, primary key
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#

class SkinType < ApplicationRecord
  has_many :members
end
