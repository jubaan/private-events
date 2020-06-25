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
end
