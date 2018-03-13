# == Schema Information
#
# Table name: guests
#
#  id            :integer          not null, primary key
#  age_id        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  country_id    :integer
#  info_way_id   :integer
#  gender        :string           default(""), not null
#  payment       :string
#  guest_type_id :string           default(""), not null
#

class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :country
  belongs_to :info_way
  belongs_to :guest_type
  belongs_to :age
end
