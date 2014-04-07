# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spot_mail do
    :booking
    :customer
    message_text { Faker::Lorem.paragraph(sentence_count = 3)}
  end
end
