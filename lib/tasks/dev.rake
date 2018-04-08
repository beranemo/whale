
namespace :dev do
  
  def rand_in_range(from, to)
    rand * (to - from) + from
  end
  
  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end
  
  last_name = ["陳", "林", "黃", "張", "李", "王", "吳", "劉", "蔡", "楊"]
  first_name = ["明", "玲", "珍", "怡", "欣", "天", "德", "華", "森", "天"]
  
  task fake_members: :environment do
    Member.destroy_all
    50.times do |i|
      phone_number = 10000000 + rand(80000000)
      phone_string = '09' + phone_number.to_s
      fax_string = '0' + phone_number.to_s.reverse
      member = Member.new(
        name: last_name.sample + "〇" + first_name.sample,
        gender: FFaker::GenderCN.random,
        phone: phone_string,
        fax: fax_string,
        birthday: FFaker::IdentificationESCO::expedition_date,
        email: FFaker::Internet::email,
        skin_type: SkinType.all.sample,
        hair_type: HairType.all.sample,
        member_type: MemberType.all.sample
        )
      member.save!
    end
    puts "create fake members, have #{Member.count} guests data"
  end
  
  task fake_guests: :environment do
    Guest.destroy_all
    
    90.times do |i|
      Guest.create!(
        payment: 100+rand(50000),
        gender: FFaker::GenderCN.random,
        guest_type: GuestType.all.sample,
        country: Country.where(id:1..6).sample,
        age: Age.all.sample,
        info_way: InfoWay.all.sample,
        user: User.in_service.sample
      )
    end
    
    guests = Guest.all
    
    guests.each do |g|
      dat = rand_time(7.days.ago).to_s
      first = dat[0..10]
      middle = 10 + rand(11)
      last = dat[13..-1]
      rand_date = first + middle.to_s + last
      
      g.created_at = rand_date
      g.save
    end
    
    puts "create fake guests, have #{Guest.count} guests data"
  end

  task fake_bulletins: :environment do
    Bulletin.destroy_all
    
    Bulletin.create!(
      start_date: rand_time(7.days.ago).to_s,
      end_date: Date.today,
      title: "洗手露半價活動",
      content: "髮身系列任兩件，享洗手露(330mL)半價優惠",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "青蜜乳液活動",
      content: "330mL青蜜滋養乳液＋髮或身系列330mL任選，贈50mL荷葉沐浴露（價值130元）",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "碗盤人促銷組合",
      content: "碗盤優惠組（1瓶550mL+2包補充包）",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "護手唇系列優惠",
      content: "手唇系列買2件贈50mL洗髮露（價值130元，桑白皮洗髮露）",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "護手唇系列優惠",
      content: "手唇系列買4贈1（價值350元）（擇價低者贈，不適用滿額禮）",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "隨單贈",
      content: "贈品牌季刊乙本",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "滿額禮",
      content: "滿1500, 贈禮輕情重體驗組",
      user: User.in_service.sample
    )
    
    Bulletin.create!(
      start_date: FFaker::Time.date,
      end_date: Date.today,
      title: "滿額禮",
      content: "滿2500, 贈小鹿版畫禮盒",
      user: User.in_service.sample
    )
    
    puts "create fake bulletins, have #{Bulletin.count} bulletins data"
  end  
  
  task fake_orders: :environment do
    Order.destroy_all

    30.times do |i|
      member = Member.all.sample
      order = Order.create!(
        user_id: User.group_by_cashier.sample.id,
        name: member.name,
        member_id: member.id,
        phone: member.phone,
        address: ["宅配","自取"].sample,
        payment_method: ["付現","刷卡"].sample,
        status: [0,1].sample
        )
      order.amount =0
      origin_amount = 0
      3.times do 
        order_item = order.order_items.build(
          product_id:Product.where.not(id:1).sample.id,
          quantity: rand(1..5)
          )
        order_item.price = order_item.product.price * order_item.quantity
        origin_amount += order_item.price
        order.discount_off = [10,20,30,40,50,60,70,80,90,100].sample
        order.amount = Integer(origin_amount*order.discount_off/100)
        order_item.save! 
      end
      

      orders = Order.all
      
      orders.each do |o|
        dat = rand_time(60.days.ago).to_s
        first = dat[0..10]
        middle = 10 + rand(11)
        last = dat[13..-1]
        rand_date = first + middle.to_s + last
        
        o.created_at = rand_date
        a = o.created_at.to_s
        a.slice!("20")
        o.sn = a.tr('-','').to_i * 1000 + o.id

        o.save
      end

      order.save!
    end
    puts "create fake order, have #{Order.count} orders with 3 order_items"
  end
  
  task fake_blogs: :environment do
    Blog.destroy_all
    
    30.times do |i|
      Blog.create!(
        published_at: FFaker::IdentificationESCO::expedition_date,
        weather: "晴",
        content: "今天新加坡客戶3人，台灣4人，澳門5人",
        user: User.in_service.sample
      )
    end
    
    puts "create fake blogs, have #{Blog.count} blogs data"
  end
  
  task fake_settings: :environment do
    
    30.times do |i|
      Setting.create!(
        code: "A" + i.to_s,
        content: "123"
      )
    end
  end


  task fake_all: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_members'].execute
    Rake::Task['dev:fake_guests'].execute
    Rake::Task['dev:fake_bulletins'].execute
    # Rake::Task['dev:fake_orders'].execute
    # Rake::Task['dev:fake_products'].execute
  end
  
  task fake_all_2: :environment do
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_members'].execute
    Rake::Task['dev:fake_guests'].execute
    Rake::Task['dev:fake_bulletins'].execute
  end
  
  task fake_all_3: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
  
end
