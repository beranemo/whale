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
end