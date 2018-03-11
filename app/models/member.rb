# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  birthday   :date             not null
#  gender     :string           default(""), not null
#  phone      :string           default(""), not null
#  skin_id    :integer
#  hair_id    :integer
#  avatar     :string
#  remark     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string           default(""), not null
#  fax        :string
#  password   :string
#  group      :string
#  zip        :string
#  county     :string
#  address    :string
#  bonus      :integer          default(0)
#

class Member < ApplicationRecord
  has_many :orders
end
