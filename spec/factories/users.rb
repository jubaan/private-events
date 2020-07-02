# This will guess the User class

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { 123_456 }
    password_confirmation { 123_456 }
  end
  trait :with_username do
    username { Faker::Name.name }
  end
end
