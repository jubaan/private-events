require "rails_helper"

# rubocop:disable Metrics/BlockLength
RSpec.feature "User is in events index page", type: :feature do
  attr_reader :event_created
  describe "User creates an event" do
    let(:event) { build :event, :with_host }

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
      expect(page).to have_content(event.title)
    end

    scenario "Clicks on log out and redirects to log in page" do
      page.find("#log-out").click
      expect(page).to have_content("Log in")
    end

    scenario "Clicks on profile link and redirects to the profile page" do
      page.find("#user-profile").click
      expect(page).to have_content("Upcoming Events")
    end
  end

  describe "Invite myself button test" do
    before do
      @user = create :user, :with_username
      @user2 = create :user, :with_username
      @new_event = create :event, :with_host, host_id: @user2.id
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in"
    end

    scenario "Clicks on 'Invite myself' button from an event and button hides" do
      within("#event-" + "#{@new_event.id}") do
        page.find(".invite-myself").click
        expect(page).not_to have_content("Invite myself")
      end
    end
  end

  describe "Im going button test" do
    before do
      @user = create :user, :with_username
      @user2 = create :user, :with_username
      @new_event = create :event, :with_host, host_id: @user2.id
      @appointment =
        create :appointment,
               :status_invited,
               event_id: @new_event.id, attendee_id: @user.id
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in"
    end

    scenario "Clicks on 'Im going' button from an event and button hides" do
      within("#event-" + "#{@new_event.id}") do
        page.find(".im-going").click
        expect(page).not_to have_content("I'm going")
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
