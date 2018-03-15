
namespace :dev do
  
  def rand_in_range(from, to)
    rand * (to - from) + from
  end
  
  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end
  
  task fake_members: :environment do
    Member.destroy_all
    
    50.times do |i|
      phone_number = 10000000 + rand(80000000)
      phone_string = '09' + phone_number.to_s
      member = Member.new(
        name: FFaker::Name::first_name,
        gender: FFaker::GenderCN.random,
        phone: phone_string,
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
    
    90.times do |i|
      Guest.create!(
        payment: 100+rand(50000),
        gender: FFaker::GenderCN.random,
        guest_type: GuestType.all.sample,
        country: Country.all.sample,
        age: Age.all.sample,
        info_way: InfoWay.all.sample,
        user: User.all.sample
      )
    end
    
    guests = Guest.all
    
    guests.each do |g|
      g.created_at = rand_time(7.days.ago)
      g.save
    end
    
    puts "create fake guests"
    puts "have #{Guest.count} guests data"
  end

  task fake_bulletins: :environment do
    Bulletin.destroy_all
    
    5.times do |i|
      Bulletin.create!(
        title: "這是標題",
        content: "這是內容",
        user: User.all.sample
      )
    end
    puts "create fake bulletins"
    puts "have #{Bulletin.count} bulletins data"
  end  
  
  task fake_all: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_members'].execute
    Rake::Task['dev:fake_guests'].execute
    Rake::Task['dev:fake_bulletins'].execute
    # Rake::Task['dev:fake_products'].execute
  end
  
end