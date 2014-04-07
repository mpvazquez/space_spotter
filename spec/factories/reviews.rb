# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    :customer
    :vendor
    review_score (1..10).to_a.sample
    review_text { Faker::Lorem.paragraph(sentence_count = 3)}
  end
end
