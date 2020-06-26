require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context 'new appointment test' do
    let(:appointment) { build :appointment }

    it 'generates an appointment' do
      expect(appointment).to be_an(Appointment)
    end
  end

  describe 'new event test' do
    let(:host) { create :user, :with_username }
    let(:attendee) { create :user, :with_username }
    let(:event) { create(:event, host_id: host.id) }

    context 'valid appointment' do
      let(:appointment) { create(:appointment, attendee_id: attendee.id, event_id: event.id) }

      it 'generates an event' do
        expect(appointment).to be_valid
      end
    end

    context 'invalid appointment without attendee' do
      let(:appointment) { build(:appointment, attendee_id: attendee.id) }

      it 'should be invalid without attendee' do
        expect(appointment).not_to be_valid
      end
    end

    context 'invalid appointment without event' do
      let(:appointment) { build(:appointment, event_id: event.id) }

      it 'should be invalid without event' do
        expect(appointment).not_to be_valid
      end
    end
  end
end
