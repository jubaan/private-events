require "date"

FactoryBot.define do
  factory :event, class: Event do
    title { Faker::Movie.unique.title }
    date { Faker::Date.between(from: Date.today - 5, to: Date.today + 5) }
    location { Faker::TvShows::TwinPeaks.unique.location }
    description { Faker::TvShows::TwinPeaks.unique.quote }

    trait :with_host do
      host_id { Faker::Number.unique.between }
    end

    trait :past_events do
      date { Faker::Date.between(from: Date.today - 10, to: Date.today - 5) }
    end
  end
end
