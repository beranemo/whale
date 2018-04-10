# == Schema Information
#
# Table name: ages
#
#  id          :integer          not null, primary key
#  age_type    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#  system_flag :string
#  is_display  :boolean          default(TRUE)
#

require 'test_helper'

class AgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
