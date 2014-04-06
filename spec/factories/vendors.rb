# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor, :class => 'Vendor' do
    first_name { Faker::Name.first_name } 
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email}
    username { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
    phone_number { Faker::PhoneNumber.short_phone_number }
    photo_url "http://placekitten.com/250/400"
    bio_text { Faker::Lorem.paragraph(sentence_count = 3) }
    city { Faker::Address.city}
    zip_code { Faker::AddressUS.zip_code}
    role "vendor"
  end
end