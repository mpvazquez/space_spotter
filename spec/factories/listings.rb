# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    title { Faker::Venue.name}
    listing_photo_url "http://www.sffilmcentre.com/eventspace/images/evsplarge2.jpg"
    description { Faker::Lorem.paragraph(sentence_count = 3)}
    address { Faker::Address.street_address(include_secondary = false)}
    city { Faker::Address.city}
    state { Faker::AddressUS.state}
    zip_code { Faker::AddressUS.zip_code}
    rate 199.99

    :vendor
  end
end
