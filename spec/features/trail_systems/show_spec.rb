require 'rails_helper'

RSpec.describe "'/trail_systems/:id'", type: :feature do
  describe "When I visit trail systems show page" do
    before :each do 
      @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
      
      @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")

      visit "/trail_systems/#{@felasco.id}"
    end
    
    # As a visitor
    # When I visit '/trail_systems/:id'
    # Then I see the trail_system with that id including the parent's attributes
    # (data from each column that is on the trail_systems table)
    describe "I see the trail_system with that id including it's attributes" do
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

    # As a visitor
    # When I visit a '/trail_systems/:id'
    # I see a count of the number of trails associated with this trail system
    describe "I see a count of the number of trails associated with this trail system" do
      it "shows trail count" do
        expect(page).to have_content("Number Of Trails: 1")
        
        @felasco.trails.create!(name: "Ravine", is_loop: false, distance: 4, difficulty: "Blue")
        visit "/trail_systems/#{@felasco.id}"
        
        expect(page).to have_content("Number Of Trails: 2")
      end
    end
  end


end