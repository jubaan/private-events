FactoryBot.define do
  factory :appointment, class: Appointment do
    attendee_id { Faker::Number.between(from: 1, to: User.all.length) }
    event_id { Faker::Number.between(from: 1, to: User.all.length) }
    status { ['confirmed', 'invited'].sample }
  end
end
