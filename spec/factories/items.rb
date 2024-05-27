FactoryBot.define do
  factory :item do
    association :user
    
    product         { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price_id { Faker::Number.between(from: 300, to: 999999) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id   { Faker::Number.between(from: 2, to: 3) }
    source_id         { Faker::Number.between(from: 2, to: 48) }
    shipping_id       { Faker::Number.between(from: 2, to: 4) }
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    
    end
  end
end