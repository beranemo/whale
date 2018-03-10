
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

  task fake_products: :environment do
    
    Product.destroy_all
    data = Roo::Spreadsheet.open('./public/test.xlsx')
    data.default_sheet = data.sheets[3] 

    for i in 2..data.last_row
      product = Product.new(
        category: data.row(i)[0],
        zh_name: data.row(i)[1],
        en_name: data.row(i)[2],
        capacity: data.row(i)[3],
        price: data.row(i)[4],
        upc: data.row(i)[5],
        use_for: data.row(i)[6],
        directions: data.row(i)[7],
        zh_m_ingredients: data.row(i)[8],
        zh_ingredients: data.row(i)[9],
        en_ingredients: data.row(i)[10]
        )
      product.save!
      puts "create product #{product.zh_name}"
    end
  end
end