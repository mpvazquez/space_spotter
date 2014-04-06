# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => 'User' do
    first_name { Faker::Name.first_name } 
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email}
    username { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
    phone_number { Faker::PhoneNumber.short_phone_number }
    photo_url "http://placekitten.com/250/350"
    address { Faker::Address.street_address(include_secondary = false)}
    city { Faker::Address.city}
    state { Faker::AddressUS.state}
    zip_code { Faker::AddressUS.zip_code}
    bio_text { Faker::Lorem.paragraph(sentence_count = 3) }
    role "customer"
  end
end
