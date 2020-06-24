require 'rails_helper'
require 'date'

RSpec.describe Event, type: :model do
  let(:user) do
    User.create(
      {
        name: 'Julio',
        username: 'Julio',
        email: 'julio@outlook.com',
        password: 123_456,
        password_confirmation: 123_456
      }
    )
  end

  let(:event) do
    Event.new
  end

  describe '::new' do
    it 'generates an event' do
      expect(user).to be_valid
    end
  end

  describe '::new' do
    it 'generates an invalid event' do
      expect(event).not_to be_valid
    end
  end

  describe '::save' do
    it '::save' do
      event.host_id = user.id
      event.title = 'party'
      event.date = Date.today
      event.location = 'the national park'
      event.description = 'this is the description of the event'

      expect(event).to be_valid
      event.save
    end
  end
end
