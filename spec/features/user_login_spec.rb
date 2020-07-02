require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'User visit private-events website', type: :feature do
  describe 'User begins at login page' do
    let(:user) { create :user, :with_username }

    scenario 'Registered User submits login form and is send to events index' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_content('Events')
    end

    scenario "Unregistered User click on 'Sign Up' link and its redirected to registartion page" do
      visit new_user_session_path
      click_link 'Sign up!'

      expect(page).to have_content('Sign up')
    end

    scenario "Unregistered User click on 'Sign Up' NavBar Button link and its redirected to registartion page" do
      visit new_user_session_path
      click_link 'Sign Up'

      expect(page).to have_content('Sign up')
    end

    scenario 'Registered user clicks on link to retrieve password' do
      visit new_user_session_path
      click_link 'Let us remind you.'

      expect(page).to have_content('Forgot')
    end

    scenario "Unregistered User fill ups the sign up form to create a new user
    and is redirected to events index page" do
      visit new_user_registration_path
      fill_in 'Name', with: user.name
      fill_in 'Username', with: user.username
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_button 'Sign up'

      expect(page).to have_content('Events')
    end
  end
end
# rubocop:enable Metrics/BlockLength
