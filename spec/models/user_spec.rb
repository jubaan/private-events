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
      expect((appointment.attendee).invited?(event.id)).to be_truthy
    end
  end

  describe '#show_im_going_btn?' do
    let (:attendee) { create :user, :with_username }
    let (:host) { create :user, :with_username }
    let (:event) { create(:event, host_id: host.id) }
    let (:appointment) { create(:appointment, :status_invited, attendee_id: attendee.id, event_id: event.id) }
    it 'should return true if the user can see the (Im going) button when is not the host of the event' do
      expect(attendee.show_im_going_btn(event.id, appointment.attendee)).to be_truthy
    end
  end

  describe '#related?' do
    let (:user) { create :user, :with_username }
    let (:event) { create(:event, host_id: user.id) }
    it 'should return true if the user has relation with an especifif events' do
      expect(user.related?(event.id)).to be_truthy
    end
  end

  describe '#past_participations' do
    let (:this_user) { create :user, :with_username }
    let (:other_user) { create :user, :with_username }
    let (:hosted_events) { hosted_events = create_list(:event, 2, :past_events, host_id: this_user.id) }
    let (:attended_events) { attended_events = create_list(:event, 2, :past_events, host_id: other_user.id) }
    let (:appointment1) { create(:appointment, :status_confirmed, attendee_id: this_user.id, event_id: attended_events[0].id) }
    let (:appointment2) { create(:appointment, :status_confirmed, attendee_id: this_user.id, event_id: attended_events[1].id) }
    before(:all) do
      Appointment.build({ status: 'confirmed', attendee_id: })
    end

    it 'should return true if the user has relation with an especifif events' do

      # byebug
      hosted = hosted_events
      attended = attended_events
      appointments = [appointment1, appointment2]

      past_participation = hosted + attended + appointments

      expect(this_user.past_participations).to contain_exactly(past_participation)
    end
  end
end
