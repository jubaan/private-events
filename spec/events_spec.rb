require 'rails_helper'
require 'date'


RSpec.describe User, type: :model do
  it 'class should exist' do

    event = Event.new(
      {
        host_id: 1,
        title: 'party',
        date: Date.today,
        location: 'the national park',
        description: 'this is the description of the event'
      }
    )
    expect(event).to be_a(Event)
  end
end
