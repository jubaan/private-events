require 'rails_helper'

RSpec.feature 'User login to private-events', type: :feature do
  let(:user) { create :user, :with_username }

  scenario 'User submits login form and is send to events index' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Events')
  end
end
