namespace :dev do
  task fake_members: :environment do
    Member.destroy_all

    50.times do |i|
      member = Member.new(
        name: FFaker::Name::first_name,
        gender: FFaker::Gender::sample,
        phone: FFaker::PhoneNumber::imei,
        birthday: FFaker::IdentificationESCO::expedition_date,
        email: FFaker::Internet::email
        )
      member.save!
      puts "create member #{i}"
    end

  end

  task fake_guest: :environment do
    Guest.destroy_all

    30.times do |i|
      Guest.create!(
        payment: FFaker::PhoneNumber.area_code,
        gender: FFaker::Gender.sample,
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