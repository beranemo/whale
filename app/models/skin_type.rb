# == Schema Information
#
# Table name: skin_types
#
#  id          :integer          not null, primary key
#  skin_type   :string
#  code        :string
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SkinType < ApplicationRecord
  has_many :members
end
