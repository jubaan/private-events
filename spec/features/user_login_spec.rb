require 'rails_helper'

RSpec.feature 'User visit private-events website', type: :feature do
  let(:user) { create :user, :with_username }

  scenario 'User submits login form and is send to events index' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Events')
  end
end

# User visit private-events website
#  he logins to his acount or sign up for an acount
#  he is taken to the event index
#  he can decide to go to create a new event or attend one
# when he succesfully creates an event is taken to the just created event show page
#   in the event show page the user can invite other uninvited usersj
# when he decides to attend an event the 'im going' button disappears
