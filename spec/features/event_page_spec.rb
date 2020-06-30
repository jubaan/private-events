require "rails_helper"

RSpec.feature "User is in events index page", type: :feature do
  describe "User creates an event" do
    attr_reader :event_created
    let(:event) { build :event, :with_host }
    let(:event2) { create :event, :with_host }

    before do
      @user = create :user, :with_username
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in"
    end

    scenario "User clicks on 'New Event' and redirects to the new event form" do
      page.find("#create-event").click
      expect(page).to have_content("New Event")
    end

    scenario "User fills in the event form" do
      page.find("#create-event").click
      fill_in "Title", with: event.title
      page.find("#event_date_1i").set("2020")
      page.find("#event_date_2i").set("01")
      page.find("#event_date_3i").set("01")
      fill_in "Location", with: event.location
      fill_in "Description", with: event.description
      click_button "Create Event"
      @@event_created = Event.find_by_title(event.title)
      # byebug
      expect(page).to have_content(event.title)
    end

    scenario "Clicks on profile link and redirects to the profile page" do
      page.find("#user-profile").click
      expect(page).to have_content("Upcoming Events")
    end

    scenario "Clicks on log out and redirects to log in page" do
      page.find("#log-out").click
      expect(page).to have_content("Log in")
    end

    scenario "Clicks on 'im going' button from an event and button hides" do
      # byebug
      within("#event-" + "#{@@event_created.id}") do
        page.find("#im-going").click
        expect(page).not_to have_content("I'm going")
      end
    end
  end
end
