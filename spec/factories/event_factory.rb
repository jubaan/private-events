require 'date'



FactoryBot.define do
  factory :event, class: Event do
    trait :complete do
      # event.host_id = user.id
      # host_id { 1 }
      title { 'party' }
      date { Date.today }
      location { 'the national park' }
      description { 'this is the description of the event' }
    end
  end
end
