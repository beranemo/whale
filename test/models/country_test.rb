# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  country_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_active    :boolean
#

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
