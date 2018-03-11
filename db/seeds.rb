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

# =======================  HairType  =======================
HairType.destroy_all

hair_type_list =[
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


# =======================  Product  =======================


Product.destroy_all

5.times do |i|
Product.create(
  category: '髮',
  zh_name: '錦葵豐盈洗髮露#{i}',
  en_name: 'Mallow Volumizing Shampoo',
  capacity: '330mL',
  price: '550',
  upc: '4711223665946',
  use_for: '一般髮質',
  directions: '建議洗髮兩次：第一次為清潔頭皮(泡沫較少)，取適量洗髮露以指腹於頭皮揉洗5~10秒，讓胺基酸潔淨成分包覆油汙後沖淨；第二次為深層滋養(泡沫細且多)，按摩揉洗30~60秒後以清水沖淨即可。',
  zh_m_ingredients: '錦葵萃取液、茶皂素(苦茶苷)、胺基酸、松精油、雪松精油、尤加利精油',
  zh_ingredients: '純水、甜菜鹼、十六酸異丙酯、甘油、胺基酸、卵磷脂、絲蘭、皂樹皮、硬脂醯胺丙基二甲基胺、丙二醇、檸檬酸、茶皂素(苦茶苷)、錦葵萃取液、蕁麻萃取液、精油(松、雪松、尤加利、檜木、廣藿香)',
  en_ingredients: 'Aqua(Water)')
end
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
puts "Product created!"
