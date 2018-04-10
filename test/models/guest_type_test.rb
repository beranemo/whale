# == Schema Information
#
# Table name: guest_types
#
#  id          :integer          not null, primary key
#  guest_type  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  note        :string
#  system_flag :string
#  is_display  :boolean          default(TRUE)
#  code        :string
#

require 'test_helper'

class GuestTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
