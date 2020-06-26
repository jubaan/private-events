FactoryBot.define do
  factory :appointment, class: Appointment do
    # attendee_id { Faker::Number.between(from: 1, to: User.all.length) }
    # event_id { Faker::Number.between(from: 1, to: User.all.length) }
    trait :status_random do
      status { ['confirmed', 'invited'].sample }
    end

    trait :status_invited do
      status { 'invited' }
    end

    trait :status_confirmed do
      status { 'confirmed' }
    end
  end
end
