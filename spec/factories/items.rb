FactoryBot.define do
  factory :item do
    product         { Faker::Commerce.product_name }
    description {}
    price_id { Faker::Commerce.price(range: 300..999999) }
    category {}
    condition {}
    delivery_fee {}
    source {}
    shipping {}
    image {}
  end
end
