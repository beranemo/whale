# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =======================  Default cashier  =======================
User.create(email: "cash@123",password: "123456",role: "cashier")
puts "Default cashier created!"

# =======================  GuestType  =======================
GuestType.destroy_all

guest_type_list =[
  { guest_type: "新客" },
  { guest_type: "舊客" }
]

guest_type_list.each do |guest_type|
  GuestType.create( guest_type: guest_type[:guest_type] )
end
puts "Guest_type created!"

# =======================  SkinType  =======================
SkinType.destroy_all

skin_type_list =[
  { skin_type: "中性膚質（一般膚質）" },
  { skin_type: "油性膚質" },
  { skin_type: "乾性膚質" },
  { skin_type: "混合性膚質" },
  { skin_type: "敏感膚質" }
]

skin_type_list.each do |skin_type|
  SkinType.create( skin_type: skin_type[:skin_type] )
end
puts "Skin_type created!"

# =======================  Country  =======================
Country.destroy_all

country_list =[
  { country_type: "台灣" },
  { country_type: "日本" },
  { country_type: "港澳"}
]

country_list.each do |country|
  Country.create( country_type: country[:country_type] )
end
puts "Country created!"

# =======================  Age  =======================
Age.destroy_all

age_list =[
  { age_type: "25 ~ 35歲" },
  { age_type: "35 ~ 45歲" },
  { age_type: "45 歲以上"}
]

age_list.each do |age|
  Age.create( age_type: age[:age_type] )
end
puts "Age created!"

# =======================  InfoWay  =======================
InfoWay.destroy_all

info_way_list =[
  { news_channel: "路過逛到" },
  { news_channel: "EXPO或其他通路買過" },
  { news_channel: "親友推薦"},
  { news_channel: "廁所洗手露來客"}
]

info_way_list.each do |info_way|
  InfoWay.create( news_channel: info_way[:news_channel] )
end
puts "Info_way created!"