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
  { note: "系統設置，無法刪除", system_flag: "Y", guest_type: "新客" },
  { note: "系統設置，無法刪除", system_flag: "Y", guest_type: "舊客" }
]

guest_type_list.each do |guest_type|
  GuestType.create( 
    note: guest_type[:note],
    guest_type: guest_type[:guest_type],
    system_flag: guest_type[:system_flag]    
  )
end
puts "Guest_type created!"

# =======================  SkinType  =======================
SkinType.destroy_all

skin_type_list = [
  { note: "系統設置，無法刪除", system_flag: "Y", value: "中性膚質（一般膚質）" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "油性膚質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "乾性膚質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "混合性膚質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "敏感膚質" }
]

skin_type_list.each do |skin_type|
  SkinType.create( 
    note: skin_type[:note],
    value: skin_type[:value],
    system_flag: skin_type[:system_flag]
    )
end
puts "Skin_type created!"

# =======================  HairType  =======================
HairType.destroy_all

hair_type_list = [
  { note: "系統設置，無法刪除", system_flag: "Y", value: "中性髮質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "油性髮質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "染燙受損髮質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "乾性髮質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "毛躁髮質" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "有頭皮屑困擾" }
]

hair_type_list.each do |hair_type|
  HairType.create( 
    note: hair_type[:note],
    value: hair_type[:value], 
    system_flag: hair_type[:system_flag] 
    )
end
puts "Hair_type created!"

# =======================  MemberType  =======================
MemberType.destroy_all

member_type_list = [
  { note: "系統設置，無法刪除", system_flag: "Y", value: "一般會員" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "VIP會員" }
]

member_type_list.each do |member_type|
  MemberType.create( 
    note: member_type[:note],
    value: member_type[:value], 
    system_flag: member_type[:system_flag] )
end
puts "Member_type created!"

# =======================  Country  =======================
Country.destroy_all

# FIXME: DEMO
country_list = [
  { is_active: true, code: "AD", system_flag: "Y", name_en_us: "Andorra", name_zh_tw: "安道爾" },
  { is_active: true, code: "AE", system_flag: "Y", name_en_us: "United Arab Emirates", name_zh_tw: "阿拉伯聯合大公國" },
  { is_active: true, code: "AF", system_flag: "Y", name_en_us: "Afghanistan", name_zh_tw: "阿富汗" },
  { is_active: true, code: "AG", system_flag: "Y", name_en_us: "Antigua And Barbuda", name_zh_tw: "安提瓜和巴爾布達(加勒比海)" },
  { is_active: true, code: "AI", system_flag: "Y", name_en_us: "Anguilla", name_zh_tw: "安圭拉島" },
  { is_active: false, code: "AL", system_flag: "Y", name_en_us: "Albania", name_zh_tw: "阿爾巴尼亞" },
  { is_active: false, code: "AM", system_flag: "Y", name_en_us: "Armenia", name_zh_tw: "亞美尼亞(西南亞)" },
  { is_active: false, code: "AN", system_flag: "Y", name_en_us: "Netherlands Antilles", name_zh_tw: "荷屬西印度群島" },
  { is_active: false, code: "AO", system_flag: "Y", name_en_us: "Angola", name_zh_tw: "安哥拉" }, 
  { is_active: false, code: "AQ", system_flag: "Y", name_en_us: "Antarctica", name_zh_tw: "南極洲" }, 
  { is_active: false, code: "AR", system_flag: "Y", name_en_us: "Argentina", name_zh_tw: "阿根廷" }, 
  { is_active: false, code: "AS", system_flag: "Y", name_en_us: "American Samoa", name_zh_tw: "美屬薩摩亞" }, 
  { is_active: false, code: "AT", system_flag: "Y", name_en_us: "Austria", name_zh_tw: "奧地利(中歐)" }, 
  { is_active: false, code: "AU", system_flag: "Y", name_en_us: "Australia", name_zh_tw: "澳大利亞" }, 
  { is_active: false, code: "AW", system_flag: "Y", name_en_us: "Aruba", name_zh_tw: "亞魯伯" }, 
  { is_active: false, code: "AZ", system_flag: "Y", name_en_us: "Azerbaijan", name_zh_tw: "亞塞拜然共和國(西南亞)" }, 

# { is_active: false, code: "", system_flag: "Y", name_en_us: "", name_zh_tw: "" }, 
  
  { is_active: true, code: "99", system_flag: "Y", name_en_us: "Others", name_zh_tw: "其他" }
]

country_list.each do |country|
  Country.create( 
    code: country[:code],
    name_en_us: country[:name_en_us], 
    name_zh_tw: country[:name_zh_tw], 
    is_active: country[:is_active] )
end
puts "Country created!"

# =======================  Age  =======================
Age.destroy_all

age_list = [
  { note: "系統設置，無法刪除", system_flag: "Y", value: "", age_type: "25 ~ 35歲" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "", age_type: "35 ~ 45歲" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "", age_type: "45 歲以上" }
]

age_list.each do |age|
  Age.create(
    age_type: age[:age_type],    
    note: age[:note],
    system_flag: age[:system_flag]      
    )
end
puts "Age created!"

# =======================  InfoWay  =======================
InfoWay.destroy_all

info_way_list = [
  { note: "系統設置，無法刪除", system_flag: "Y", value: "網路平台", news_channel: "網路平台" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "臉書 Facebook", news_channel: "臉書 Facebook" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "誠品 EXPO 或其他通路買過", news_channel: "誠品 EXPO 或其他通路買過" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "集資計劃", news_channel: "集資計劃" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "路過逛到(松菸誠品)", news_channel: "路過逛到(松菸誠品)" },  
  { note: "系統設置，無法刪除", system_flag: "Y", value: "親友介紹", news_channel: "親友介紹" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "電視媒體", news_channel: "電視媒體" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "飯店民宿", news_channel: "飯店民宿" },
  { note: "系統設置，無法刪除", system_flag: "Y", value: "廁所洗手露來客", news_channel: "廁所洗手露來客"},
  { note: "系統設置，無法刪除", system_flag: "Y", value: "其他", news_channel: "其他"}
]

info_way_list.each do |info_way|
  InfoWay.create( 
    news_channel: info_way[:news_channel],
    note: info_way[:note],
    system_flag: info_way[:system_flag] 
  )
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
  { note: "系統設置，無法刪除", is_active: true, content: "無", code: "E" },
  { note: "系統設置，無法刪除", is_active: true, content: "優惠價", code: "D" },
  { note: "系統設置，無法刪除", is_active: true, content: "贈品", code: "C" },
  { note: "系統設置，無法刪除", is_active: true, content: "打折", code: "B" },
  { note: "系統設置，無法刪除", is_active: true, content: "第二件半價", code: "A" }
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
Product.create(zh_name: "折價卷", price: 0)
puts "Default_Coupon created!"
