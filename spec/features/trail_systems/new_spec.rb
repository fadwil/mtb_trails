require 'rails_helper'

RSpec.describe "/trail_systems/new", type: :feature do
  # As a visitor
  # When I visit the Trail System Index page
  # Then I see a link to create a new Trail System record, "New Trail System"
  # When I click this link
  # Then I am taken to '/trail_systems/new' where I  see a form for a new trail system record
  # When I fill out the form with a new trail system's attributes:
  # And I click the button "Create Trail System" to submit the form
  # Then a `POST` request is sent to the '/trail_systems' route,
  # a new trail system record is created,
  # and I am redirected to the Trail System Index page where I see the new Trail System displayed.
  describe "I see a link to create a new Trail System record, 'New Trail System'" do
    it "displays link to New Trail System" do
      visit "/trail_systems"
      expect(page).to have_link("New Trail System", href: "/trail_systems/new")
    end

    it "when I click this link then I am taken to '/trail_systems/new' where I see a form for a new trail system" do
      visit "/trail_systems"

      click_link("New Trail System")
      expect(current_path).to eq("/trail_systems/new")
    end
  end

  describe "when I fill out the form and submit a new trail system is created" do
    it "can create a new trail system" do
      visit '/trail_systems/new'

      fill_in("Name", with: "Pisgah")
      select("false", from: :has_fee)
      fill_in("Highest Trailhead", with: 6399)
      click_button("Create Trail System")
      expect(current_path).to eq("/trail_systems")
      expect(page).to have_content("Pisgah")
    end
  end
end