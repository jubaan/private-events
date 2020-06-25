require 'rails_helper'

RSpec.feature "User creates an account filling and submitting the sign-up form", type: :feature do
  scenario 'they see the sign-up form' do
    name = 'Julio'
    username = 'jubaan'
    email = 'julio.ab@outlook.com'
    password = 123456

    visit new_user_registration_path
    fill_in 'user_name', with: name
    fill_in 'user_username', with: username
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_on 'Sign up'

    expect(page).to have_link index_page
  end
end

#user visit website and sees the login page
# - unregistered user clicks on sign up! and is taken to the sign up page
# -- user fills the sign up page and is taken to the events index / root path
# - registered user fills the log in page and is taken to the index page
# -- user sees the events page
# - user clicks on create an event and is taken to the new event page
# -- user fills new event form and submit the form and is taken to the event show
# page
# - user clicks in the kkkkkkkkk
