FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 100)}
    next_last_name        {Faker::Japanese::Name.last_name.yomi}
    next_first_name       {Faker::Japanese::Name.first_name.yomi}
  end
end