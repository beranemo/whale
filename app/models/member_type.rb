class MemberType < ApplicationRecord
  has_many :members, foreign_key: "member_code", primary_key: "code"
end
