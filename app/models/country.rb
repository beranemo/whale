# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  nat        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ApplicationRecord
  has_many :guests
end
