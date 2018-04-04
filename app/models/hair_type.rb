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
#

class HairType < ApplicationRecord
  has_many :members, foreign_key: "hair_code", primary_key: "code"
end
