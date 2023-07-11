require 'rails_helper'

RSpec.describe "/trail_systems/:id/edit", type: :feature do
  before :each do 
    @pisgah = TrailSystem.create!(name: "Pisgah", has_fee: false, highest_trailhead: 6399)
  end
  # As a visitor
  # When I visit a trail system show page
  # Then I see a link to update the parent "Update Trail System"
  # When I click the link "Update Trail System"
  # Then I am taken to '/trail_systems/:id/edit' where I  see a form to edit the trail system's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/trail_systems/:id',
  # the trail system's info is updated,
  # and I am redirected to the trail system's Show page where I see the trail system's updated info
  describe "I see a link to update the parent 'Update Trail System'" do
    it "links to edit page" do
      visit "/trail_systems/#{@pisgah.id}"
      expect(page).to have_link("Update Trail System", href: "/trail_systems/#{@pisgah.id}/edit")
    end
    
    it "when I click the link I am taken to '/trail_systems/:id/edit' where I see a form to edit the trail system's attributes" do
      visit "/trail_systems/#{@pisgah.id}"
      
      click_link "Update Trail System"
      
      expect(current_path).to eq("/trail_systems/#{@pisgah.id}/edit")
    end
  end

  describe "When I fill out the form with updated info and submit the trail systems info is updated" do
    it "updates the trail system info and redirects to systems show page" do
      visit "/trail_systems/#{@pisgah.id}/edit"

      fill_in "Name", with: "Pisgah Forest"
      click_button "Save Trail System"

      expect(current_path).to eq("/trail_systems")
      expect(page).to have_content("Pisgah Forest")
    end

  end
end