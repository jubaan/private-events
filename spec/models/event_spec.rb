require 'rails_helper'

RSpec.describe Event, type: :model do

  @event = new :event, :complete

  # describe '::new' do
    it 'generates an event' do
      expect(@event).to be_a(Event)
    end
  # end

  # describe '::new' do
    it 'generates an invalid event' do
      expect(event).not_to be_valid
    end
  # end

#   describe '::save' do
#     it '::save' do
#       user = create :user
#       event.host_id = user.id
#       event.title = 'party'
#       event.date = Date.today
#       event.location = 'the national park'
#       event.description = 'this is the description of the event'

#       expect(event).to be_valid
#       event.save
    # end
  # end
end
