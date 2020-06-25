require 'date'

FactoryBot.define do
  factory :event, class: Event do
    title { Faker::Movie.title }
    date { Faker::Date.between(from: Date.today - 5, to: Date.today + 5) }
    location { Faker::TvShows::TwinPeaks.location }
    description { Faker::TvShows::TwinPeaks.quote }

    trait :with_host do
      host_id { Faker::Number.between }
    end
  end
end
