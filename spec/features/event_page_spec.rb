require "rails_helper"

RSpec.feature "User is in events index page", type: :feature do
  describe "User creates an event" do
    let(:user) { create :user, :with_username }
    # let(:event) { build :event, :with_host }
    # before(:all) do
    # end

    scenario "User clicks on 'New Event' and fills the new event form" do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"

      page.find("#create-event").click
      # click_link create_link

      # fill_in "Title", with: event.title
      # fill_in "Date", with: event.date
      # fill_in "Location", with: event.location
      # fill_in "Description", with: event.description

      # click_button "Create Event"

      expect(page).to have_content("New Event")
    end
  end
end
