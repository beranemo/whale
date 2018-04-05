# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  name           :string           default(""), not null
#  birthday       :date             not null
#  gender         :string           default(""), not null
#  phone          :string           default(""), not null
#  skin           :string
#  hair           :string
#  avatar         :string
#  remark         :string
#  member_code    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email          :string           default(""), not null
#  fax            :string
#  password       :string
#  group          :string
#  zip            :string
#  county         :string
#  address        :string
#  bonus          :integer          default(0)
#  skin_type_id   :integer
#  hair_id        :integer
#  hair_code      :string
#  hair_type_id   :integer
#  member_type_id :integer
#

class Member < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  
  belongs_to :skin_type
  belongs_to :hair_type
  belongs_to :member_type
  has_many :orders
  
  def self.to_csv
    zh_attr = %w{姓名 生日 性別 email 電話 傳真 會員群組 郵遞區號 居住縣市 居住地址 紅利點數  膚質 髮質}
    attributes = %w{name birthday gender email phone fax member_code zip county address bonus }
    CSV.generate(headers: true) do |csv|
      csv << zh_attr

      all.each do |member|
        data = member.attributes.values_at(*attributes)
        data << member.skin_type.value << member.hair_type.value
        csv << data
      end
    end
  end
end
