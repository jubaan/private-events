# This will guess the User class

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 123456 }
    password_confirmation { 123456 }
  end
  trait :with_username do
    username { Faker::Name.name }
  end
end
