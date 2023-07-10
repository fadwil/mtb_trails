require 'rails_helper'

RSpec.describe "trail systems index", type: :feature do
  before :each do 
    @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
    @santos = TrailSystem.create!(name: "Santos", has_fee: false, highest_trailhead: 241)
    @pisgah = TrailSystem.create!(name: "Pisgah", has_fee: false, highest_trailhead: 6399)
    visit "/trail_systems"
  end

  # For each parent table
  # As a visitor
  # When I visit '/trail_systems'
  # Then I see the name of each trail system record in the system
  describe "When I visit '/trail_systems'" do
    it "I see the name of each trail system" do
      expect(page).to have_content(@felasco.name)
      expect(page).to have_content(@santos.name)
      expect(page).to have_content(@pisgah.name)
    end
  end

  # As a visitor
  # When I visit the trail_systems index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  describe "I see that records are ordered by most recently created first" do
    it "orders by most recently created" do
      expect(@pisgah.name).to appear_before(@santos.name)
      expect(@santos.name).to appear_before(@felasco.name)
    end
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the trail Index
  describe "I see a link at the top of the page that takes me to the trail Index" do
    it "displays link to trail index" do
      expect(page).to have_link("See all trails", href: "/trails")
    end

    it "when I click the button I am taken to the trail index page" do
      click_link("See all trails")
      expect(current_path).to eq("/trails")
    end
  end

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the trail systems Index

  describe "I see a link at the top of the page that takes me to the trail systems index" do
    it "displays link to trail index" do
      expect(page).to have_link("See all trail systems", href: "/trail_systems")
    end

    it "when I click the button I am taken to the trail systems index page" do
      click_link("See all trail systems")
      expect(current_path).to eq("/trail_systems")
    end
  end
end