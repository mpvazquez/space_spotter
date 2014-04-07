# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeslot do
    date {Faker::Time.date}
    start_time "9:00"
    stop_time "10:00"
    :listing
  end
end
