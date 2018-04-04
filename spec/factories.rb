FactoryBot.define do
  
  factory :user do
    username "Joe"
    email "joe@gmail.com"
    password "blah"
  end

  factory :product do
    zh_name "洗髮露"
    price 350

  end

  factory :cart do
    product
    cart
    discount_method
    discount_off
  end
end
