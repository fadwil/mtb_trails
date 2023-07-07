require 'rails_helper'

RSpec.describe "trail systems show", type: :feature do
  # As a visitor
  # When I visit '/trail_systems/:id'
  # Then I see the trail_system with that id including the parent's attributes
  # (data from each column that is on the trail_systems table)
  describe "When I visit '/trail_systems/:id'" do
    describe "I see the trail_system with that id including it's attributes" do
      before :each do 
        @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)

        visit "/trail_systems/#{@felasco.id}"
      end

      it "shows the trail_system name" do
        expect(page).to have_content(@felasco.name)
      end

      it "shows the trail_system has_fee" do
        expect(page).to have_content(@felasco.has_fee)
      end

      it "shows the trail_system highest_trailhead" do
        expect(page).to have_content(@felasco.highest_trailhead)
      end
    end
  end
end