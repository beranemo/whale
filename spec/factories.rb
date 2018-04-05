FactoryBot.define do
  
  factory :user do
    name "Joe"
    email "joe@gmail.com"
    password "123456"
    role "cashier"
    factory :user_with_orders do
      transient do
        orders_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:order, evaluator.orders_count, user: user)
      end
    end
  end

  factory :order do
    member 
    payment_method ["付現","刷卡"].sample
    address ["宅配","自取"].sample
    status false
  end


  factory :member do
    name FFaker::Name.html_safe_last_name
    gender FFaker::GenderCN.random
    birthday Date.current
    email FFaker::Internet::email
    phone FFaker::PhoneNumberFR::mobile_phone_number
    skin_type 
    hair_type
    member_type
  end

  factory :skin_type do

  end

  factory :hair_type do

  end

  factory :member_type do

  end

  factory :product do
    zh_name "洗髮露"
    price 350..1000

  end

  factory :cart_item do
    product
    discount_method
    discount_off
    cart
    quantity
  end

  factory :cart do
     factory :cart_with_cart_items do
      after(:create) do |cart|
        create_list(:cart_item,  cart: cart)
      end
    end
  end


end
