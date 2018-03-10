# == Schema Information
#
# Table name: hair_types
#
#  id          :integer          not null, primary key
#  code        :string
#  value       :string
#  system_flag :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HairType < ApplicationRecord
end
