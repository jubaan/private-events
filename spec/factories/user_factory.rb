# This will guess the User class

FactoryBot.define do
  factory :user, class: User do
    username { 'username' }
    name { 'User Name' }
    password { 'password' }
    password_confirmation { 'password' }
    email { 'user@email.com' }
  end
end
