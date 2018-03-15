# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =======================  Default cashier  =======================
User.destroy_all

User.create(email: "cash@123", password: "123456", role: "cashier", name: "小魚")
User.create(email: "cash@456", password: "123456", role: "cashier", name: "小鯨")
User.create(email: "cash@789", password: "123456", role: "cashier", name: "小蘋果")

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
  SkinType.create( skin_type: skin_type[:skin_type] )
end
puts "Skin_type created!"

# =======================  HairType  =======================
HairType.destroy_all

hair_type_list = [
  { code: "A", system_flag: "Y", value: "中性髮質" },
  { code: "B", system_flag: "Y", value: "油性髮質" },
  { code: "C", system_flag: "Y", value: "染燙受損髮質" },
  { code: "D", system_flag: "Y", value: "乾性髮質" },
  { code: "E", system_flag: "Y", value: "毛躁髮質" },
  { code: "F", system_flag: "Y", value: "有頭皮屑困擾" }
]

hair_type_list.each do |hair_type|
  HairType.create( value: hair_type[:value], code: hair_type[:code], system_flag: hair_type[:system_flag] )
end
puts "Hair_type created!"

# =======================  Country  =======================
Country.destroy_all

country_list = [
  { code: "TW", system_flag: "Y", value: "台灣", country_type: "台灣" },
  { code: "JP", system_flag: "Y", value: "日本", country_type: "日本" },
  { code: "HK_MA", system_flag: "Y", value: "港澳", country_type: "港澳"}
]

country_list.each do |country|
  Country.create( country_type: country[:country_type] )
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
  { code: "HOME", system_flag: "Y", value: "家", name: "家" },
  { code: "HAIR", system_flag: "Y", value: "髮", name: "髮" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"

=begin
Product.create(
  category: '',
  zh_name: '',
  en_name: '',
  capacity: '',
  price: '',
  upc: '',
  use_for: '',
  directions: '',
  zh_m_ingredients: '',
  zh_ingredients: '',
  en_ingredients: '')
=end
