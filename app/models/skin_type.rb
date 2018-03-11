# == Schema Information
#
# Table name: skin_types
#
#  id         :integer          not null, primary key
#  skin_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SkinType < ApplicationRecord
  has_many :members
end
