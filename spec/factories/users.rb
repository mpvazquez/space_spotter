# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :class => 'Users' do
    first_name { Faker::Name.first_name } 
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email}
    password { Faker::BaconIpsum.word }
    phone_number { Faker::PhoneNumber.short_phone_number }
    photo_url "http://placekitten.com/250/350"
    bio_text { Faker::Lorum.paragraph(sentence_count = 3) }
  end
end
