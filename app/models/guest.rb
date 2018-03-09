# == Schema Information
#
# Table name: guests
#
#  id          :integer          not null, primary key
#  age         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  country_id  :integer
#  sex_id      :integer
#  info_way_id :integer
#

class Guest < ApplicationRecord

  belongs_to :country
  belongs_to :info_way
  belongs_to :guest_type
  belongs_to :age
end
