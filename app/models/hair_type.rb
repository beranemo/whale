# == Schema Information
#
# Table name: hair_types
#
#  id          :integer          not null, primary key
#  code        :string
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HairType < ApplicationRecord
  has_many :members, foreign_key: "hair_code", primary_key: "code"
end
