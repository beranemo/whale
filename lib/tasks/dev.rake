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
end