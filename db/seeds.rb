require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

past_date = Date.today-1
future_date = Date.today+1

User.create([{name: 'julio', username:'julio', email: 'julio.ab@outlook.com',  password: 123456, password_confirmation: 123456},{name: 'miguel', username:'mighty mike', email: 'mighty@mike.com', password: 123456, password_confirmation: 123456}, {name: 'lalo', username:'lalos', email: 'lalos@lalos.com', password: 123456, password_confirmation: 123456}])

Event.create([{host_id: 2, title: 'new party', description: 'this is going to be the best party ever in the world so come an go wild!', location: 'the national park', date: past_date }, {host_id: 1, title: 'CRAAAAAAZY NIGHT', description: 'this is going to be the best party ever in the world so come an go wild!', location: 'the national park', date: future_date}])

Appointment.create([{attendee_id: 1, event_id: 1, status: 'invited'},{attendee_id: 2, event_id: 2, status: 'invited'}])
