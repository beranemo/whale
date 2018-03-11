
namespace :dev do
  task fake_members: :environment do
    Member.destroy_all
    
    50.times do |i|
      member = Member.new(
        name: FFaker::Name::first_name,
        gender: FFaker::GenderCN.random,
        phone: FFaker::PhoneNumber::imei,
        birthday: FFaker::IdentificationESCO::expedition_date,
        email: FFaker::Internet::email,
        skin_type: SkinType.all.sample
        )
      member.save!
      # puts "create member #{i}"
    end
    puts "create fake members"
    puts "have #{Member.count} guests data"
  end
  
  task fake_guests: :environment do
    Guest.destroy_all
    
    30.times do |i|
      Guest.create!(
        payment: 100+rand(50000),
        gender: FFaker::GenderCN.random,
        guest_type: GuestType.all.sample,
        country: Country.all.sample,
        age: Age.all.sample,
        info_way: InfoWay.all.sample
      )
    end
    puts "create fake guests"
    puts "have #{Guest.count} guests data"
  end

  
  
  task fake_products: :environment do
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
      en_ingredients: 'Aqua(Water)'
      )
    end
    Product.create(
      category: '家',
      zh_name: '碗盤洗潔液',
      en_name: 'Tea Seed Dishwashing Liquid',
      capacity: '550mL',
      price: '250',
      upc: '4711223665952',
      use_for: '',
      directions: '將適量之洗潔液倒在濕潤的海綿上稍加揉搓，帶微微起泡後，擦拭清洗之碗盤器具，再用清水沖洗乾淨。',
      zh_m_ingredients: '茶皂素(苦茶苷)、綠茶',
      zh_ingredients: '水、茶籽粉、月桂醯胺丙基甜菜鹼、麵粉、阿拉伯膠、三仙膠、精鹽、綠茶粉、紅茶粉',
      en_ingredients: 'Aqua(Water)'
      )
    puts "Product created!"
  end
  
  task fake_all: :environment do
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_members'].execute
    Rake::Task['dev:fake_guests'].execute
    Rake::Task['dev:fake_products'].execute
  end
  
end