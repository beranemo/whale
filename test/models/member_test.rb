# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  birthday   :date             not null
#  gender     :string           default(""), not null
#  phone      :string           default(""), not null
#  skin       :string
#  hair       :string
#  avatar     :string
#  remark     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string           default(""), not null
#

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
