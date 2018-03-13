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
#  user_id       :integer
#

require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
