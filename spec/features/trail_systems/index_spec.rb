require 'rails_helper'

RSpec.describe "trail systems index", type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/trail_systems'
  # Then I see the name of each trail system record in the system
  describe "When I visit '/trail_systems'" do
    it "I see the name of each trail system" do
      felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
      santos = TrailSystem.create!(name: "Santos", has_fee: false, highest_trailhead: 241)

      visit "/trail_systems"
      # save_and_open_page

      expect(page).to have_content(felasco.name)
      expect(page).to have_content(santos.name)
    end
  end
end