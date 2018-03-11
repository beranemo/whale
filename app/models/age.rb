# == Schema Information
#
# Table name: ages
#
#  id         :integer          not null, primary key
#  age_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Age < ApplicationRecord
  has_many :guests
end
