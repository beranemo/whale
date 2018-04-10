# == Schema Information
#
# Table name: info_ways
#
#  id           :integer          not null, primary key
#  news_channel :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  note         :string
#  system_flag  :string
#  is_display   :boolean          default(TRUE)
#

require 'test_helper'

class InfoWayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
