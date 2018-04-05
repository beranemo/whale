# == Schema Information
#
# Table name: member_types
#
#  id          :integer          not null, primary key
#  value       :string
#  system_flag :string           default("N")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#

class MemberType < ApplicationRecord
  has_many :members
end
