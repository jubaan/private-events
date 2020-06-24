require 'rails_helper'
require 'date'
# require 'pry-byebug'


RSpec.describe Event, type: :model do
  let (:user) { User.create(
    {
      name: 'Julio',
      username: 'Julio',
      email: 'julio@outlook.com',
      password: 123456,
      password_confirmation: 123456
    }
  )
  }

  $stderr.puts User.all

  event = Event.new()
  # let (:event) { event = Event.new() }

  # describe '::new' do
  it 'creates an event' do
    expect(event).to be_a(Event)
  end
  # end

  # describe '::new' do
  it 'generating an invalid event' do
    expect(user).to be_valid
    # expect(event).not_to be_valid
  end
  # end

  # describe '::save' do
  it '::save' do
    event.host_id = 1
    event.title= 'party'
    event.date= Date.today
    event.location= 'the national park'
    event.description= 'this is the description of the event'

    event.save

    expect(event).to be_valid

    # expect(Event.find_by_id(event.id)).to valid
  end
  # end
end
