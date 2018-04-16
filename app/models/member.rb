# == Schema Information
#
# Table name: members
#
#  id             :integer          not null, primary key
#  name           :string           default(""), not null
#  birthday       :date             not null
#  gender         :string           default(""), not null
#  phone          :string           default(""), not null
#  avatar         :string
#  remark         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  email          :string           default(""), not null
#  fax            :string
#  password       :string
#  zip            :string
#  county         :string
#  address        :string
#  bonus          :integer          default(0)
#  skin_type_id   :integer
#  hair_type_id   :integer
#  member_type_id :integer
#  info_way_id    :integer
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

  def self.update_by_file(file)
    attribute = Hash["姓名" => "name" ,
                    "電話" => "phone",
                    "性別" => "gender",
                    "email" => "email",
                    "生日" => "birthday",
                    "傳真" => "fax",
                    "會員群組" => "member_type_id",
                    "郵遞區號" => "zip",
                    "居住縣市" => "county",
                    "居住地址" => "address",
                    "紅利點數" => "bonus",
                    "請問您是如何認識茶籽堂" => "info_way_id",
                    "您的膚質為何" => "skin_type_id",
                    "您的髮質為何" => "hair_type_id"                    
                    ]
    sheet = Roo::Spreadsheet.open(file.path)
    header = sheet.row(1)
    header.each_with_index do |val, index|
      header[index] = attribute[val]
    end

    for i in 2..sheet.last_row()
      row = Hash[[header,sheet.row(i)].transpose]
      row.delete(nil)
      member = find_by(phone: row["phone"]) || new
      
      skin_type_id = SkinType.find_by(value: row["skin_type_id"]).id
      hair_type_id = HairType.find_by(value: row["hair_type_id"]).id
      member_type_id = MemberType.find_by(value: row["member_type_id"]).id
      info_way_id = InfoWay.find_by(news_channel: row["info_way_id"]).id
      row["skin_type_id"] = skin_type_id
      row["hair_type_id"] = hair_type_id
      row["member_type_id"] = member_type_id
      row["info_way_id"] = info_way_id
      member.attributes = row.to_hash

      member.save!
    end

  end

  def find_age_type
    age = Date.current.year - birthday.year
    if age <= 25
      Age.find_by(age_type: "18 ~ 24歲").id
    elsif age <=35
      Age.find_by(age_type: "25 ~ 34歲").id
    elsif age <=45
      Age.find_by(age_type: "35 ~ 44歲").id
    elsif age <=55
      Age.find_by(age_type: "45 ~ 54歲").id
    else
      Age.find_by(age_type: "55 歲以上").id
    end
  end
  scope :display, -> { where(is_display: true).order(system_flag: :asc) }
end
