require 'rails_helper'

RSpec.describe User, type: :model do
  context 'new user test' do
    let(:user) { build :user }

    it 'generates an user' do
      expect(user).to be_an(User)
    end
  end

  describe 'validation test' do
    context 'invalid user' do
      let(:user) { build :user }
      it 'should be invalid' do
        expect(user).not_to be_valid
      end
    end

    context 'valid user' do
      let(:user) { create :user, :with_username }
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    context 'association test' do
      let(:user) { create :user, :with_username  }
      let(:event) { create(:event, host_id: user.id) }
      it 'event should belong to user' do
        expect(user.events).to include(event)
      end
    end
  end

  describe '#host?' do
    let (:user) { create :user, :with_username }
    let (:event) { create(:event, host_id: user.id) }
    it 'should return true if the user is the host of the event' do
      expect(user.host?(event.id)).to be_truthy
    end
  end

  describe '#current_user?' do
    let (:current_user) { create :user, :with_username }
    it 'should return true if the user is the host of the event' do
      expect(current_user.current_user?(current_user)).to be_truthy
    end
  end

  describe '#invited?' do
    let (:attendee) { create :user, :with_username }
    let (:host) { create :user, :with_username }
    let (:event) { create(:event, host_id: host.id) }
    let (:appointment) { create(:appointment, :status_invited, attendee_id: attendee.id, event_id: event.id) }
    it 'should return true if the user is invited to the event' do
      # byebug
      expect(appointments.attendee && attendee.invited?(event.id)).to be_truthy
    end
  end
end
