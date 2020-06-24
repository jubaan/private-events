require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
    {
      name: Faker::Name.name,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456'
    }
  )
end

10.times do
  event = Event.create(
    {
      host_id: Faker::Number.between(from: 1, to: User.all.length),
      title: Faker::Movie.title,
      date: Faker::Date.between(from: '2020-01-01', to: '2021-12-31'),
      location: Faker::TvShows::TwinPeaks.location,
      location: Faker::TvShows::TwinPeaks.quote
    }
  )

  3.times do
    Appointment.create(
      {
        attendee_id: Faker::Number.between(from: 1, to: User.all.length),
        event_id: event.id,
        status: 'invited'
      }
    )
  end
end

User.all.each do |user|
  3.times do
    Appointment.create(
      {
        event_id: Faker::Number.between(from:1, to: User.all.length),
        attendee_id: user.id,
        status: ['confimed', 'invited'].sample
      }
    )
  end
end
