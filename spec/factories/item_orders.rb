FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdeefghijk0000000000000000'}
    post_code { '243-0213' }
    source_id { '4' }
    city { '厚木素' }
    house_number { '英123-123' }
    building_name { '前里ビル153' }
    phone   { '00000000000' }
  end
end
