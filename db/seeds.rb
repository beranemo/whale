# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =======================  Default cashier  =======================
User.destroy_all
User.create(email: "admin@123", password: "123456", role: "admin", name: "管理員")
User.create(email: "cash@123", password: "123456", role: "cashier", name: "小魚")
User.create(email: "cash@456", password: "123456", role: "cashier", name: "小鯨")
User.create(email: "cash@789", password: "123456", role: "cashier", name: "小蘋果")
User.create(email: "cash@168", password: "123456", role: "cashier", name: "小金", resigned: true)
User.create(email: "sp831031@gmail.com", password: "123456", role: "storehouse", name: "倉庫人員")
puts "Default cashier created!"

# =======================  GuestType  =======================
GuestType.destroy_all

guest_type_list = [
  { code: "N", system_flag: "Y", value: "新客", guest_type: "新客" },
  { code: "O", system_flag: "Y", value: "新客", guest_type: "舊客" }
]

guest_type_list.each do |guest_type|
  GuestType.create( guest_type: guest_type[:guest_type] )
end
puts "Guest_type created!"

# =======================  SkinType  =======================
SkinType.destroy_all

skin_type_list = [
  { code: "A", system_flag: "Y", value: "中性膚質（一般膚質）", skin_type: "中性膚質（一般膚質）" },
  { code: "B", system_flag: "Y", value: "油性膚質", skin_type: "油性膚質" },
  { code: "C", system_flag: "Y", value: "乾性膚質", skin_type: "乾性膚質" },
  { code: "D", system_flag: "Y", value: "混合性膚質", skin_type: "混合性膚質" },
  { code: "E", system_flag: "Y", value: "敏感膚質", skin_type: "敏感膚質" }
]

skin_type_list.each do |skin_type|
  SkinType.create( 
    code: skin_type[:code],
    value: skin_type[:value],
    system_flag: skin_type[:system_flag]
    )
end
puts "Skin_type created!"

# =======================  HairType  =======================
HairType.destroy_all

hair_type_list = [
  { note: "系統設置，不能刪除", code: "A", system_flag: "Y", value: "中性髮質" },
  { note: "系統設置，不能刪除", code: "B", system_flag: "Y", value: "油性髮質" },
  { note: "系統設置，不能刪除", code: "C", system_flag: "Y", value: "染燙受損髮質" },
  { note: "系統設置，不能刪除", code: "D", system_flag: "Y", value: "乾性髮質" },
  { note: "系統設置，不能刪除", code: "E", system_flag: "Y", value: "毛躁髮質" },
  { note: "系統設置，不能刪除", code: "F", system_flag: "Y", value: "有頭皮屑困擾" }
]

hair_type_list.each do |hair_type|
  HairType.create( 
    note: hair_type[:note],
    code: hair_type[:code],
    value: hair_type[:value], 
    system_flag: hair_type[:system_flag] 
    )
end
puts "Hair_type created!"

# =======================  MemberType  =======================
MemberType.destroy_all

member_type_list = [
  { code: "GENERAL", system_flag: "Y", value: "一般會員" },
  { code: "VIP", system_flag: "Y", value: "VIP會員" }
]

member_type_list.each do |member_type|
  MemberType.create( value: member_type[:value], code: member_type[:code], system_flag: member_type[:system_flag] )
end
puts "Member_type created!"

# =======================  Country  =======================
Country.destroy_all

country_list = [
  { is_active: true, code: "TW", system_flag: "Y", value: "台灣", country_type: "台灣",  },
  { is_active: true, code: "JP", system_flag: "Y", value: "日本", country_type: "日本" },
  { is_active: true, code: "HK", system_flag: "Y", value: "香港", country_type: "香港" },
  { is_active: true, code: "CN", system_flag: "Y", value: "大陸", country_type: "大陸" },
  { is_active: true, code: "MO", system_flag: "Y", value: "澳門", country_type: "澳門" },
  { is_active: false, code: "MY", system_flag: "Y", value: "馬來西亞", country_type: "馬來西亞" },
  { is_active: false, code: "AU", system_flag: "Y", value: "澳洲", country_type: "澳洲" },
  { is_active: true, code: "BR", system_flag: "Y", value: "巴西", country_type: "巴西" },
  { is_active: false, code: "NL", system_flag: "Y", value: "荷蘭", country_type: "荷蘭" },
  { is_active: false, code: "NZL", system_flag: "Y", value: "紐西蘭", country_type: "紐西蘭" },
  { is_active: false, code: "NO", system_flag: "Y", value: "挪威", country_type: "挪威" },
  { is_active: true, code: "PH", system_flag: "Y", value: "菲律賓", country_type: "菲律賓" },
  { is_active: false, code: "ZA", system_flag: "Y", value: "南非", country_type: "南非" },
  { is_active: true, code: "TH", system_flag: "Y", value: "泰國", country_type: "泰國" },
  { is_active: true, code: "UK", system_flag: "Y", value: "英國", country_type: "英國" },
  { is_active: true, code: "US", system_flag: "Y", value: "美國", country_type: "美國" },
  { is_active: true, code: "FR", system_flag: "Y", value: "法國", country_type: "法國" },
  { is_active: true, code: "DE", system_flag: "Y", value: "德國", country_type: "德國" },
  { is_active: false, code: "KR", system_flag: "Y", value: "韓國", country_type: "韓國" },
  { is_active: true, code: "99", system_flag: "Y", value: "其他", country_type: "其他" }
]

country_list.each do |country|
  Country.create( country_type: country[:country_type], is_active: country[:is_active] )
end
puts "Country created!"

# =======================  Age  =======================
Age.destroy_all

age_list = [
  { code: "25_35", system_flag: "Y", value: "", age_type: "25 ~ 35歲" },
  { code: "35_45", system_flag: "Y", value: "", age_type: "35 ~ 45歲" },
  { code: "45_up", system_flag: "Y", value: "", age_type: "45 歲以上" }
]

age_list.each do |age|
  Age.create( age_type: age[:age_type] )
end
puts "Age created!"

# =======================  InfoWay  =======================
InfoWay.destroy_all

info_way_list = [
  { code: "A", system_flag: "Y", value: "路過逛到", news_channel: "路過逛到" },
  { code: "B", system_flag: "Y", value: "EXPO或其他通路買過", news_channel: "EXPO或其他通路買過" },
  { code: "C", system_flag: "Y", value: "親友推薦", news_channel: "親友推薦"},
  { code: "D", system_flag: "Y", value: "廁所洗手露來客", news_channel: "廁所洗手露來客"}
]

info_way_list.each do |info_way|
  InfoWay.create( news_channel: info_way[:news_channel] )
end
puts "Info_way created!"

# =======================  Category  =======================
Category.destroy_all

category_list = [
  { code: "OIL", system_flag: "Y", value: "油", name: "油" },  
  { code: "HAIR", system_flag: "Y", value: "髮", name: "髮" },
  { code: "BODY", system_flag: "Y", value: "身", name: "身" },
  { code: "HOME", system_flag: "Y", value: "家", name: "家" },
  { code: "GIFT", system_flag: "Y", value: "禮", name: "禮" },
  { code: "REFILL", system_flag: "Y", value: "補", name: "補" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"

# =======================  Discount_Method  =======================
DiscountMethod.destroy_all

discount_method_list = [
  { note: "系統設置，不能刪除", is_active: true, content: "無", code: "E" },
  { note: "系統設置，不能刪除", is_active: true, content: "優惠價", code: "D" },
  { note: "系統設置，不能刪除", is_active: true, content: "贈品", code: "C" },
  { note: "系統設置，不能刪除", is_active: true, content: "打折", code: "B" },
  { note: "系統設置，不能刪除", is_active: true, content: "第二件半價", code: "A" }
]

discount_method_list.each do |d_method|
  DiscountMethod.create(
    content: d_method[:content], 
    code: d_method[:code], 
    is_active: d_method[:is_active],
    note: d_method[:note]
    )
end
puts "Discount_Method created!"

# =======================  Default_Coupon  =======================
Product.create(zh_name: "折價卷",price: 0)
puts "Default_Coupon created!"


