# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    :timeslot
    :customer

    review_score (1..10).to_a.sample
    review_text { Faker::Lorem.paragraph(sentence_count = 3)}
    price 100.00
  end
end
