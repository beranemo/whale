# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  birthday     :date             not null
#  gender       :string           default(""), not null
#  phone        :string           default(""), not null
#  skin         :string
#  hair         :string
#  avatar       :string
#  remark       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  email        :string           default(""), not null
#  fax          :string
#  password     :string
#  group        :string
#  zip          :string
#  county       :string
#  address      :string
#  bonus        :integer          default(0)
#  skin_type_id :integer
#  hair_id      :integer
#  hair_code    :string
#

class Member < ApplicationRecord
  belongs_to :skin_type
  belongs_to :hair_type, foreign_key: "hair_code", primary_key: "code"
end
