# == Schema Information
#
# Table name: member_types
#
#  id          :integer          not null, primary key
#  code        :string
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MemberType < ApplicationRecord
  has_many :members, foreign_key: "member_code", primary_key: "code"
end
