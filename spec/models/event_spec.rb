require 'rails_helper'
require 'date'

RSpec.describe Event, type: :model do
  context 'new event test' do
    let(:event) { build :event }

    it 'generates an event' do
      expect(event).to be_an(Event)
    end
  end

  describe 'validation test' do
    context 'invalid event' do
      let(:event) { build :event }
      it 'should be invalid' do
        expect(event).not_to be_valid
      end
    end

    context 'valid event' do
      let(:user) { create :user, :with_username }
      let(:event) { build(:event, host_id: user.id) }
      it 'generates an event' do
        expect(event).to be_valid
      end
    end
  end

  context 'association test' do
    let(:user) { create :user, :with_username }
    let(:event) { build(:event, host_id: user.id) }
    it 'event should belong to user' do
      expect(event.host).to eq(user)
    end
  end
end
