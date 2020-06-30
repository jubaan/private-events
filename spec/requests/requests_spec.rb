require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  before :each do
    @user = attributes_for(:user)
  end


  context 'with valid attributes for user' do
    it 'saves the new user in the database' do
      expect do
        post :create, user: attributes_for(:user, user_attributes: @user).to_change((User :count).by(1))
      end
    end
  end

  before do
    @event = attributes_for(:event, :with_host, host_id: 1)
  end

  context 'with valid attributes for event' do
    it 'saves the new event in the database' do
      expect do
        post :create, event: attributes_for(:event, event: @event).to_change((Event :count).by(1))
      end
    end
  end
end
