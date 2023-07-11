require "rails_helper"

RSpec.describe "/trail_systems/:id/trails/new", type: :feature do
  before :each do
    @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
    @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")

  end
  # As a visitor
  # When I visit a Trail System's Trail Index page
  # Then I see a link to add a new Trail for that system "Add Trail"
  # When I click the link
  # I am taken to '/trail_systems/:id/trails/new' where I see a form to add a new trail
  # When I fill in the form with the trail's attributes:
  # And I click the button "Add Trail"
  # Then a `POST` request is sent to '/trail_systems/:id/trails/',
  # a new trail object/row is created for that system,
  # and I am redirected to the Trail System's Trail Index page where I can see the new trail listed
  describe "I see a link to add a new Trail for that system 'Create Trail'" do
    it "displays a link to create New Trail" do
      visit "/trail_systems/#{@felasco.id}/trails"
      expect(page).to have_link("Add Trail", href: "/trail_systems/#{@felasco.id}/trails/new")
    end

    it "when I click this link then I am taken to '/trail_systems/:id/trails/new' where I see a form to add a new trail" do
      visit "/trail_systems/#{@felasco.id}/trails"

      click_link("Add Trail")
      expect(current_path).to eq("/trail_systems/#{@felasco.id}/trails/new")
    end
  end
  describe "when I fill in the form and submit a new trail is added to the system" do
    it "can create a new trail" do
      visit "/trail_systems/#{@felasco.id}/trails/new"

      fill_in("Name", with: "Sweet Gum")
      select("true", from: :is_loop)
      fill_in("Distance", with: 1)
      fill_in("Difficulty", with: "Green")
      click_button("Add Trail")
      expect(current_path).to eq("/trail_systems/#{@felasco.id}/trails")
    end
  end
end