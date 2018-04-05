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

country_list = [
  { is_active: false, code: "AD", system_flag: "Y", name_en_us: "Andorra", name_zh_tw: "安道爾" },
  { is_active: false, code: "AE", system_flag: "Y", name_en_us: "United Arab Emirates", name_zh_tw: "阿拉伯聯合大公國" },
  { is_active: false, code: "AF", system_flag: "Y", name_en_us: "Afghanistan", name_zh_tw: "阿富汗" },
  { is_active: false, code: "AG", system_flag: "Y", name_en_us: "Antigua And Barbuda", name_zh_tw: "安提瓜和巴爾布達(加勒比海)" },
  { is_active: false, code: "AI", system_flag: "Y", name_en_us: "Anguilla", name_zh_tw: "安圭拉島" },
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
  { is_active: false, code: "BA", system_flag: "Y", name_en_us: "Bosnia And Herzegowina", name_zh_tw: "波斯尼亞" },
  { is_active: false, code: "BB", system_flag: "Y", name_en_us: "Barbados", name_zh_tw: "巴貝多(加勒比海)" },
  { is_active: false, code: "BD", system_flag: "Y", name_en_us: "Bangladesh", name_zh_tw: "孟加拉" },
  { is_active: false, code: "BE", system_flag: "Y", name_en_us: "Belgium", name_zh_tw: "比利時" },
  { is_active: false, code: "BF", system_flag: "Y", name_en_us: "Burkina Faso", name_zh_tw: "布吉納法索(南非)" },
  { is_active: false, code: "BG", system_flag: "Y", name_en_us: "Bulgaria", name_zh_tw: "保加利亞(東歐)" },
  { is_active: false, code: "BH", system_flag: "Y", name_en_us: "Bahrain", name_zh_tw: "巴林(波斯灣)" },
  { is_active: false, code: "BI", system_flag: "Y", name_en_us: "Burundi", name_zh_tw: "蒲隆地(中非)" },
  { is_active: false, code: "BJ", system_flag: "Y", name_en_us: "Benin", name_zh_tw: "貝南(西非)" }, 
  { is_active: false, code: "BM", system_flag: "Y", name_en_us: "Bermuda", name_zh_tw: "百慕達群島(大西洋西部)" }, 
  { is_active: false, code: "BN", system_flag: "Y", name_en_us: "Brunei Darussalam", name_zh_tw: "汶萊(東亞)" }, 
  { is_active: false, code: "BO", system_flag: "Y", name_en_us: "Bolivia", name_zh_tw: "玻利維亞(南美洲)" }, 
  { is_active: false, code: "BR", system_flag: "Y", name_en_us: "Brazil", name_zh_tw: "巴西(南美)" }, 
  { is_active: false, code: "BS", system_flag: "Y", name_en_us: "Bahamas", name_zh_tw: "巴哈馬群島" }, 
  { is_active: false, code: "BT", system_flag: "Y", name_en_us: "Bhutan", name_zh_tw: "不丹(印度北部)" }, 
  { is_active: false, code: "BV", system_flag: "Y", name_en_us: "Bouvet Island", name_zh_tw: "布干維爾島" }, 
  { is_active: false, code: "BW", system_flag: "Y", name_en_us: "Botswana", name_zh_tw: "波札那(南非)" }, 
  { is_active: false, code: "BY", system_flag: "Y", name_en_us: "Belarus", name_zh_tw: "柏勞斯" }, 
  { is_active: false, code: "BZ", system_flag: "Y", name_en_us: "Belize", name_zh_tw: "貝里斯(加勒比海)" },
  { is_active: false, code: "CA", system_flag: "Y", name_en_us: "Canada", name_zh_tw: "加拿大" },
  { is_active: false, code: "CC", system_flag: "Y", name_en_us: "Cocos (Keeling) Islands", name_zh_tw: "可可斯群島(椰子島)" },
  { is_active: false, code: "CF", system_flag: "Y", name_en_us: "Central African Republic", name_zh_tw: "中非共和國" },
  { is_active: false, code: "CG", system_flag: "Y", name_en_us: "Congo", name_zh_tw: "剛果民主共和國" },
  { is_active: false, code: "CH", system_flag: "Y", name_en_us: "Switzerland", name_zh_tw: "瑞士(中歐)" },
  { is_active: false, code: "CK", system_flag: "Y", name_en_us: "Cook Islands ", name_zh_tw: "科克群島" },
  { is_active: false, code: "CL", system_flag: "Y", name_en_us: "Chile", name_zh_tw: "智利(南美洲西南部)" },
  { is_active: false, code: "CM", system_flag: "Y", name_en_us: "Cameroon", name_zh_tw: "喀麥隆(西非)" },
  { is_active: true, code: "CN", system_flag: "AB", name_en_us: "China", name_zh_tw: "中國" },
  { is_active: false, code: "CO", system_flag: "Y", name_en_us: "Colombia", name_zh_tw: "哥倫比亞" },
  { is_active: false, code: "CR", system_flag: "Y", name_en_us: "Costa Rica", name_zh_tw: "哥斯大黎加(中美洲)" },
  { is_active: false, code: "CU", system_flag: "Y", name_en_us: "Cuba", name_zh_tw: "古巴(加勒比海)" },
  { is_active: false, code: "CV", system_flag: "Y", name_en_us: "Cape Verde", name_zh_tw: "維德角(大西洋東部)" },
  { is_active: false, code: "CX", system_flag: "Y", name_en_us: "Christmas Island", name_zh_tw: "聖誕島嶼" },
  { is_active: false, code: "CY", system_flag: "Y", name_en_us: "Cyprus", name_zh_tw: "賽普勒斯(土耳其西南方)" },
  { is_active: false, code: "CZ", system_flag: "Y", name_en_us: "Czech Republic", name_zh_tw: "捷克(中歐)" },
  { is_active: false, code: "DE", system_flag: "Y", name_en_us: "Germany", name_zh_tw: "德國" },
  { is_active: false, code: "DJ", system_flag: "Y", name_en_us: "Djibouti", name_zh_tw: "吉布地(東非)" },
  { is_active: false, code: "DK", system_flag: "Y", name_en_us: "Denmark", name_zh_tw: "丹麥(西北歐)" },
  { is_active: false, code: "DM", system_flag: "Y", name_en_us: "Dominica", name_zh_tw: "多明尼克島(加勒比海)" },
  { is_active: false, code: "DO", system_flag: "Y", name_en_us: "Dominican Republic", name_zh_tw: "多明尼加(加勒比海)" },
  { is_active: false, code: "DZ", system_flag: "Y", name_en_us: "Algeria", name_zh_tw: "阿爾及利亞" },
  { is_active: false, code: "EC", system_flag: "Y", name_en_us: "Ecuador", name_zh_tw: "厄瓜多爾(南美洲西北部)" },
  { is_active: false, code: "EE", system_flag: "Y", name_en_us: "Estonia", name_zh_tw: "愛沙尼亞(波羅的海)" },
  { is_active: false, code: "EG", system_flag: "Y", name_en_us: "Egypt", name_zh_tw: "埃及" },
  { is_active: false, code: "EH", system_flag: "Y", name_en_us: "Western Sahara ", name_zh_tw: "西撒哈拉沙漠" },
  { is_active: false, code: "ER", system_flag: "Y", name_en_us: "Eritrea", name_zh_tw: "厄立特里亞(東北非)" },
  { is_active: false, code: "ES", system_flag: "Y", name_en_us: "Spain", name_zh_tw: "西班牙" },
  { is_active: false, code: "ET", system_flag: "Y", name_en_us: "Ethiopia", name_zh_tw: "衣索比亞" },
  { is_active: false, code: "FI", system_flag: "Y", name_en_us: "Finland", name_zh_tw: "芬蘭(東北歐)" },
  { is_active: false, code: "FJ", system_flag: "Y", name_en_us: "Fiji", name_zh_tw: "裴濟(西南太平洋)" },
  { is_active: false, code: "FK", system_flag: "Y", name_en_us: "Falkland Islands (Malvinas)", name_zh_tw: "福克蘭群島" },
  { is_active: false, code: "FM", system_flag: "Y", name_en_us: "Micronesia, Federated States Of", name_zh_tw: "密克羅尼西亞(太平洋西部)" },
  { is_active: false, code: "FR", system_flag: "Y", name_en_us: "France", name_zh_tw: "法國" },
  { is_active: false, code: "FX", system_flag: "Y", name_en_us: "France, Metropolitan", name_zh_tw: "法國，大都市的" },
  { is_active: false, code: "GA", system_flag: "Y", name_en_us: "Gabon", name_zh_tw: "加彭(中非西部)" },
  { is_active: false, code: "GB", system_flag: "Y", name_en_us: "United Kingdom ", name_zh_tw: "英國" },
  { is_active: false, code: "GD", system_flag: "Y", name_en_us: "Grenada", name_zh_tw: "格瑞那達(西印度群島東南部)" },
  { is_active: false, code: "GE", system_flag: "Y", name_en_us: "Georgia", name_zh_tw: "喬治亞洲" },
  { is_active: false, code: "GF", system_flag: "Y", name_en_us: "French Guiana", name_zh_tw: "法屬圭亞那(南美洲東北部)" },
  { is_active: false, code: "GH", system_flag: "Y", name_en_us: "Ghana", name_zh_tw: "迦納(西非)" },
  { is_active: false, code: "GI", system_flag: "Y", name_en_us: "Gibraltar", name_zh_tw: "直布羅陀海峽" },
  { is_active: false, code: "GL", system_flag: "Y", name_en_us: "Greenland", name_zh_tw: "格陵蘭(北大西洋)" },
  { is_active: false, code: "GM", system_flag: "Y", name_en_us: "Gambia", name_zh_tw: "甘比亞" },
  { is_active: false, code: "GN", system_flag: "Y", name_en_us: "Guinea", name_zh_tw: "幾內亞(西非)" },
  { is_active: false, code: "GP", system_flag: "Y", name_en_us: "Guadeloupe", name_zh_tw: "瓜達康納爾島" },
  { is_active: false, code: "GQ", system_flag: "Y", name_en_us: "Equatorial Guinea ", name_zh_tw: "赤道幾內亞(西非)" },
  { is_active: false, code: "GR", system_flag: "Y", name_en_us: "Greece", name_zh_tw: "希臘" },
  { is_active: false, code: "GS", system_flag: "Y", name_en_us: "S. Georgia And The S. Sandwich Islands", name_zh_tw: "喬治亞州" },
  { is_active: false, code: "GT", system_flag: "Y", name_en_us: "Guatemala", name_zh_tw: "瓜地馬拉" },
  { is_active: false, code: "GU", system_flag: "Y", name_en_us: "Guam", name_zh_tw: "關島" },
  { is_active: false, code: "GW", system_flag: "Y", name_en_us: "Guinea-Bissau", name_zh_tw: "幾內亞比索" },
  { is_active: false, code: "GY", system_flag: "Y", name_en_us: "Guyana", name_zh_tw: "蓋亞那" },
  { is_active: true, code: "HK", system_flag: "AD", name_en_us: "Hong Kong", name_zh_tw: "香港" },
  { is_active: false, code: "HN", system_flag: "Y", name_en_us: "Honduras", name_zh_tw: "宏都拉斯" },
  { is_active: false, code: "HR", system_flag: "Y", name_en_us: "CROATIA (Local Name: Hrvatska)", name_zh_tw: "克羅埃西亞" },
  { is_active: false, code: "HT", system_flag: "Y", name_en_us: "Haiti", name_zh_tw: "海地" },
  { is_active: false, code: "HU", system_flag: "Y", name_en_us: "Hungary", name_zh_tw: "匈牙利" },
  { is_active: false, code: "ID", system_flag: "Y", name_en_us: "Indonesia", name_zh_tw: "印尼" },
  { is_active: false, code: "IE", system_flag: "Y", name_en_us: "Ireland", name_zh_tw: "愛爾蘭" },
  { is_active: false, code: "IL", system_flag: "Y", name_en_us: "Israel", name_zh_tw: "以色列" },
  { is_active: false, code: "IN", system_flag: "Y", name_en_us: "India", name_zh_tw: "印度" },
  { is_active: false, code: "IO", system_flag: "Y", name_en_us: "British Indian Ocean Territory", name_zh_tw: "英屬印度洋領域" },
  { is_active: false, code: "IQ", system_flag: "Y", name_en_us: "Iraq", name_zh_tw: "伊拉克" },
  { is_active: false, code: "IR", system_flag: "Y", name_en_us: "Iran (Islamic Republic Of)", name_zh_tw: "伊朗" },
  { is_active: false, code: "IS", system_flag: "Y", name_en_us: "Iceland", name_zh_tw: "冰島" },
  { is_active: false, code: "IT", system_flag: "Y", name_en_us: "Italy", name_zh_tw: "義大利" },
  { is_active: false, code: "JM", system_flag: "Y", name_en_us: "Jamaica", name_zh_tw: "牙買加" },
  { is_active: false, code: "JO", system_flag: "Y", name_en_us: "Jordan", name_zh_tw: "約旦" },
  { is_active: true, code: "JP", system_flag: "AE", name_en_us: "Japan", name_zh_tw: "日本" },
  { is_active: false, code: "KE", system_flag: "Y", name_en_us: "Kenya", name_zh_tw: "肯亞" },
  { is_active: false, code: "KH", system_flag: "Y", name_en_us: "Cambodia", name_zh_tw: "高棉(柬埔寨)" },
  { is_active: false, code: "KI", system_flag: "Y", name_en_us: "Kiribati", name_zh_tw: "吉里巴斯" },
  { is_active: false, code: "KM", system_flag: "Y", name_en_us: "Comoros", name_zh_tw: "葛摩伊斯蘭聯邦共和國(印度洋西部)" },
  { is_active: true, code: "KP", system_flag: "AD", name_en_us: "Korea, Democratic People's Rep. Of ", name_zh_tw: "南韓" },
  { is_active: false, code: "KR", system_flag: "Y", name_en_us: "Korea, Republic Of", name_zh_tw: "北韓" },
  { is_active: false, code: "KW", system_flag: "Y", name_en_us: "Kuwait", name_zh_tw: "科威特" },
  { is_active: false, code: "KY", system_flag: "Y", name_en_us: "Cayman Islands", name_zh_tw: "開曼群島" },
  { is_active: false, code: "KZ", system_flag: "Y", name_en_us: "Kazakhstan", name_zh_tw: "哈薩克" },
  { is_active: false, code: "LA", system_flag: "Y", name_en_us: "Lao People's Democratic Republic", name_zh_tw: "寮國" },
  { is_active: false, code: "LB", system_flag: "Y", name_en_us: "Lebanon", name_zh_tw: "黎巴嫩" },
  { is_active: false, code: "LC", system_flag: "Y", name_en_us: "Saint Lucia ", name_zh_tw: "聖路其亞" },
  { is_active: false, code: "LI", system_flag: "Y", name_en_us: "Liechtenstein", name_zh_tw: "列支敦斯登" },
  { is_active: false, code: "LK", system_flag: "Y", name_en_us: "Sri Lanka", name_zh_tw: "斯里蘭卡" },
  { is_active: false, code: "LR", system_flag: "Y", name_en_us: "Liberia", name_zh_tw: "賴比瑞亞" },
  { is_active: false, code: "LS", system_flag: "Y", name_en_us: "Lesotho", name_zh_tw: "賴索托" },
  { is_active: false, code: "LT", system_flag: "Y", name_en_us: "Lithuania", name_zh_tw: "立陶宛" },
  { is_active: false, code: "LU", system_flag: "Y", name_en_us: "Luxembourg", name_zh_tw: "盧森堡" },
  { is_active: false, code: "LV", system_flag: "Y", name_en_us: "Latvia", name_zh_tw: "拉脫維亞" },
  { is_active: false, code: "LY", system_flag: "Y", name_en_us: "Libyan Arab Jamahiriya", name_zh_tw: "利比亞阿拉伯的Jamahiriya" },
  { is_active: false, code: "MA", system_flag: "Y", name_en_us: "Morocco", name_zh_tw: "摩洛哥" },
  { is_active: false, code: "MC", system_flag: "Y", name_en_us: "Monaco", name_zh_tw: "摩納哥" },
  { is_active: false, code: "MG", system_flag: "Y", name_en_us: "Madagascar", name_zh_tw: "馬達加斯加" },
  { is_active: false, code: "MH", system_flag: "Y", name_en_us: "Marshall Islands", name_zh_tw: "馬紹爾群島" },
  { is_active: false, code: "MK", system_flag: "Y", name_en_us: "M acedonia, The Former Yugoslav Rep. Of", name_zh_tw: "馬其頓" },
  { is_active: false, code: "ML", system_flag: "Y", name_en_us: "Mali", name_zh_tw: "馬利" },
  { is_active: false, code: "MN", system_flag: "Y", name_en_us: "Mongolia", name_zh_tw: "蒙古" },
  { is_active: true, code: "MO", system_flag: "AC", name_en_us: "Macau", name_zh_tw: "澳門" },
  { is_active: false, code: "MP", system_flag: "Y", name_en_us: "Northern Mariana Islands", name_zh_tw: "馬里亞納群島" },
  { is_active: false, code: "MQ", system_flag: "Y", name_en_us: "Martinique", name_zh_tw: "聖馬丁節" },
  { is_active: false, code: "MR", system_flag: "Y", name_en_us: "Mauritania", name_zh_tw: "茅利塔尼亞" },
  { is_active: false, code: "MS", system_flag: "Y", name_en_us: "Montserrat", name_zh_tw: "蒙特色納島" },
  { is_active: false, code: "MT", system_flag: "Y", name_en_us: "Malta", name_zh_tw: "馬爾他" },
  { is_active: false, code: "MU", system_flag: "Y", name_en_us: "Mauritius", name_zh_tw: "模里西斯" },
  { is_active: false, code: "MV", system_flag: "Y", name_en_us: "Maldives", name_zh_tw: "馬爾地夫" },
  { is_active: false, code: "MW", system_flag: "Y", name_en_us: "Malawi", name_zh_tw: "馬拉威" },
  { is_active: false, code: "MX", system_flag: "Y", name_en_us: "Mexico", name_zh_tw: "墨西哥" },
  { is_active: false, code: "MY", system_flag: "Y", name_en_us: "Malaysia", name_zh_tw: "馬來群島" },
  { is_active: false, code: "MZ", system_flag: "Y", name_en_us: "Mozambique", name_zh_tw: "莫三比克" },
  { is_active: false, code: "NA", system_flag: "Y", name_en_us: "Namibia", name_zh_tw: "納米比亞" },
  { is_active: false, code: "NC", system_flag: "Y", name_en_us: "New Caledonia", name_zh_tw: "新蘇格蘭" },
  { is_active: false, code: "NE", system_flag: "Y", name_en_us: "Niger", name_zh_tw: "尼日" },
  { is_active: false, code: "NF", system_flag: "Y", name_en_us: "Norfolk Island", name_zh_tw: "諾福克島嶼" },
  { is_active: false, code: "NG", system_flag: "Y", name_en_us: "Nigeria", name_zh_tw: "奈及利亞" },
  { is_active: false, code: "NI", system_flag: "Y", name_en_us: "Nicaragua", name_zh_tw: "尼加拉瓜" },
  { is_active: false, code: "NL", system_flag: "Y", name_en_us: "Netherlands", name_zh_tw: "荷蘭" },
  { is_active: false, code: "NO", system_flag: "Y", name_en_us: "Norway", name_zh_tw: "挪威" },
  { is_active: false, code: "NP", system_flag: "Y", name_en_us: "Nepal", name_zh_tw: "尼泊爾" },
  { is_active: false, code: "NR", system_flag: "Y", name_en_us: "Nauru", name_zh_tw: "諾魯" },
  { is_active: false, code: "NU", system_flag: "Y", name_en_us: "Niue", name_zh_tw: "尼烏亞島" },
  { is_active: false, code: "NZ", system_flag: "Y", name_en_us: "New Zealand", name_zh_tw: "新西蘭" },
  { is_active: false, code: "OM", system_flag: "Y", name_en_us: "Oman", name_zh_tw: "阿曼" },
  { is_active: false, code: "PA", system_flag: "Y", name_en_us: "Panama", name_zh_tw: "巴拿馬" },
  { is_active: false, code: "PE", system_flag: "Y", name_en_us: "Peru", name_zh_tw: "秘魯" },
  { is_active: false, code: "PF", system_flag: "Y", name_en_us: "French Polynesia", name_zh_tw: "玻里尼西亞" },
  { is_active: false, code: "PG", system_flag: "Y", name_en_us: "Papua New Guinea", name_zh_tw: "巴布亞新幾內亞" },
  { is_active: false, code: "PH", system_flag: "Y", name_en_us: "Philippines", name_zh_tw: "菲律賓群島" },
  { is_active: false, code: "PK", system_flag: "Y", name_en_us: "Pakistan", name_zh_tw: "巴基斯坦" },
  { is_active: false, code: "PL", system_flag: "Y", name_en_us: "Poland", name_zh_tw: "波蘭" },
  { is_active: false, code: "PR", system_flag: "Y", name_en_us: "Puerto Rico ", name_zh_tw: "波多黎各" },
  { is_active: false, code: "PT", system_flag: "Y", name_en_us: "Portugal", name_zh_tw: "葡萄牙" },
  { is_active: false, code: "PW", system_flag: "Y", name_en_us: "Palau", name_zh_tw: "帛琉" },
  { is_active: false, code: "PY", system_flag: "Y", name_en_us: "Paraguay", name_zh_tw: "巴拉圭" },
  { is_active: false, code: "QA", system_flag: "Y", name_en_us: "Qatar", name_zh_tw: "卡達" },
  { is_active: false, code: "RE", system_flag: "Y", name_en_us: "Reunion", name_zh_tw: "留尼旺島" },
  { is_active: false, code: "RO", system_flag: "Y", name_en_us: "Romania", name_zh_tw: "羅馬尼亞" },
  { is_active: false, code: "RU", system_flag: "Y", name_en_us: "Russian Federation", name_zh_tw: "俄羅斯聯邦" },
  { is_active: false, code: "RW", system_flag: "Y", name_en_us: "Rwanda", name_zh_tw: "盧安達" },
  { is_active: false, code: "SA", system_flag: "Y", name_en_us: "Saudi Arabia", name_zh_tw: "沙烏地阿拉伯" },
  { is_active: false, code: "SB", system_flag: "Y", name_en_us: "Solomon Islands", name_zh_tw: "所羅門群島" },
  { is_active: false, code: "SC", system_flag: "Y", name_en_us: "Seychelles", name_zh_tw: "賽席爾群島" },
  { is_active: false, code: "SD", system_flag: "Y", name_en_us: "Sudan", name_zh_tw: "蘇丹" },
  { is_active: false, code: "SE", system_flag: "Y", name_en_us: "Sweden", name_zh_tw: "瑞典" },
  { is_active: false, code: "SG", system_flag: "Y", name_en_us: "Singapore", name_zh_tw: "新加坡" },
  { is_active: false, code: "SH", system_flag: "Y", name_en_us: "St. Helena St．Helena", name_zh_tw: "聖赫勒拿島" },
  { is_active: false, code: "SI", system_flag: "Y", name_en_us: "Slovenia", name_zh_tw: "斯洛法尼亞" },
  { is_active: false, code: "SJ", system_flag: "Y", name_en_us: "Svalbard And Jan Mayen Islands", name_zh_tw: "冷岸和央麥恩島" },
  { is_active: false, code: "SK", system_flag: "Y", name_en_us: "Slovakia (Slovak Republic)", name_zh_tw: "斯洛法克人共和國" },
  { is_active: false, code: "SL", system_flag: "Y", name_en_us: "Sierra Leone", name_zh_tw: "獅子山" },
  { is_active: false, code: "SM", system_flag: "Y", name_en_us: "San Marino", name_zh_tw: "聖馬利諾s" },
  { is_active: false, code: "SN", system_flag: "Y", name_en_us: "Senegal", name_zh_tw: "塞內加爾" },
  { is_active: false, code: "SO", system_flag: "Y", name_en_us: "Somalia", name_zh_tw: "索馬利亞" },
  { is_active: false, code: "SR", system_flag: "Y", name_en_us: "Suriname", name_zh_tw: "蘇利南" },
  { is_active: false, code: "SV", system_flag: "Y", name_en_us: "El Salvador", name_zh_tw: "薩爾瓦多(中南美洲)" },
  { is_active: false, code: "SY", system_flag: "Y", name_en_us: "Syrian Arab Republic ", name_zh_tw: "敘利亞" },
  { is_active: false, code: "SZ", system_flag: "Y", name_en_us: "Swaziland", name_zh_tw: "史瓦濟蘭" },
  { is_active: false, code: "TC", system_flag: "Y", name_en_us: "Turks And Caicos Islands", name_zh_tw: "土克斯和開卡斯群島" },
  { is_active: false, code: "TD", system_flag: "Y", name_en_us: "Chad", name_zh_tw: "查德(中北非)" },
  { is_active: false, code: "TF", system_flag: "Y", name_en_us: "French Southern Territories", name_zh_tw: "法國南方領域" },
  { is_active: false, code: "TG", system_flag: "Y", name_en_us: "Togo", name_zh_tw: "土哥(西非)" },
  { is_active: false, code: "TH", system_flag: "Y", name_en_us: "Thailand", name_zh_tw: "泰國" },
  { is_active: false, code: "TK", system_flag: "Y", name_en_us: "Tokelau", name_zh_tw: "托客勞群島" },
  { is_active: false, code: "TM", system_flag: "Y", name_en_us: "Turkmenistan", name_zh_tw: "土庫曼(中亞)" },
  { is_active: false, code: "TN", system_flag: "Y", name_en_us: "Tunisia", name_zh_tw: "突尼西亞(北非)" },
  { is_active: false, code: "TO", system_flag: "Y", name_en_us: "Tonga", name_zh_tw: "東加王國(西南太平洋)" },
  { is_active: false, code: "TR", system_flag: "Y", name_en_us: "Turkey", name_zh_tw: "土耳其" },
  { is_active: false, code: "TT", system_flag: "Y", name_en_us: "Trinidad And Tobago ", name_zh_tw: "千理達和托貝哥共和國" },
  { is_active: false, code: "TV", system_flag: "Y", name_en_us: "Tuvalu", name_zh_tw: "吐瓦魯(西南太平洋)" },
  { is_active: true, code: "TW", system_flag: "AA", name_en_us: "Taiwan", name_zh_tw: "臺灣" },
  { is_active: false, code: "TZ", system_flag: "Y", name_en_us: "Tanzania", name_zh_tw: "坦尚尼亞" },
  { is_active: false, code: "UA", system_flag: "Y", name_en_us: "Ukraine", name_zh_tw: "烏克蘭" },
  { is_active: false, code: "UG", system_flag: "Y", name_en_us: "Uganda", name_zh_tw: "烏干達" },
  { is_active: false, code: "UK", system_flag: "Y", name_en_us: "United Kingdom", name_zh_tw: "英國" },
  { is_active: false, code: "UM", system_flag: "Y", name_en_us: "United States Minor Outlying Islands", name_zh_tw: "聯合的狀況微小的在外的島嶼" },
  { is_active: false, code: "US", system_flag: "Y", name_en_us: "United States", name_zh_tw: "美國" },
  { is_active: false, code: "UY", system_flag: "Y", name_en_us: "Uruguay", name_zh_tw: "烏拉圭" },
  { is_active: false, code: "UZ", system_flag: "Y", name_en_us: "Uzbekistan", name_zh_tw: "烏茲別克斯坦" },
  { is_active: false, code: "VA", system_flag: "Y", name_en_us: "Vatican City State (Holy See)", name_zh_tw: "梵蒂岡" },
  { is_active: false, code: "VE", system_flag: "Y", name_en_us: "Venezuela", name_zh_tw: "委內瑞拉(南美洲北部)" },
  { is_active: false, code: "VG", system_flag: "Y", name_en_us: "Virgin Islands (British)", name_zh_tw: "英屬維爾京群島" },
  { is_active: false, code: "VI", system_flag: "Y", name_en_us: "Virgin Islands (U.S.)", name_zh_tw: "美英屬維爾京群島" },
  { is_active: false, code: "VN", system_flag: "Y", name_en_us: "Viet Nam", name_zh_tw: "越南" },
  { is_active: false, code: "VU", system_flag: "Y", name_en_us: "Vanuatu", name_zh_tw: "梵尼瓦土;萬那杜(南太平洋)" },
  { is_active: false, code: "WF", system_flag: "Y", name_en_us: "Wallis And Futuna Islands", name_zh_tw: "沃利斯和富圖納群島" },
  { is_active: false, code: "WS", system_flag: "Y", name_en_us: "Samoa", name_zh_tw: "薩摩亞群島" },
  { is_active: false, code: "YE", system_flag: "Y", name_en_us: "Yemen", name_zh_tw: "葉門" },
  { is_active: false, code: "YT", system_flag: "Y", name_en_us: "Mayotte", name_zh_tw: "梅約特" },
  { is_active: false, code: "YU", system_flag: "Y", name_en_us: "Yugoslavia", name_zh_tw: "南斯拉夫" },
  { is_active: false, code: "ZA", system_flag: "Y", name_en_us: "South Africa", name_zh_tw: "南非" },
  { is_active: false, code: "ZM", system_flag: "Y", name_en_us: "Zambia", name_zh_tw: "尚比亞" },
  { is_active: false, code: "ZR", system_flag: "Y", name_en_us: "Zaire", name_zh_tw: "扎伊爾" },
  { is_active: false, code: "ZW", system_flag: "Y", name_en_us: "Zimbabwe", name_zh_tw: "辛巴威(南非)" },
  { is_active: true, code: "99", system_flag: "Y", name_en_us: "Others", name_zh_tw: "其他" }
]

country_list.each do |country|
  Country.create( 
    code: country[:code],
    name_en_us: country[:name_en_us], 
    name_zh_tw: country[:name_zh_tw], 
    system_flag: country[:system_flag], 
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

# =======================  Setting  =======================
Setting.destroy_all
Setting.create(label: "倉庫信箱", code: "STOREHOUSE", content: "sp831031@gmail.com", note: "倉庫信箱")



