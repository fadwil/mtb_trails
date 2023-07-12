require 'rails_helper'

RSpec.describe "trails index", type: :feature do
  # As a visitor
  # When I visit '/trails'
  # Then I see each trail in the system including the Trail's attributes
  # (data from each column that is on the trails table)
  describe "When I visit '/trails'" do
    before :each do
      @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
      @santos = TrailSystem.create!(name: "Santos", has_fee: false, highest_trailhead: 241)

      @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")
      @ravine = @felasco.trails.create!(name: "Ravine", is_loop: false, distance: 4, difficulty: "Blue")

      @vortex = @santos.trails.create!(name: "Vortex", is_loop: true, distance: 3, difficulty: "Black")
      @marshmallow = @santos.trails.create!(name: "Marshmallow", is_loop: false, distance: 3, difficulty: "Green")
      
      visit "/trails"
    end

    describe "I see each trail in the system and the Trail's attributes" do
      it "shows trail name" do
        expect(page).to have_content(@tung_nut.name)
        expect(page).to have_content(@vortex.name)
      end

      it "shows is_loop" do
        expect(page).to have_content(@tung_nut.is_loop)
        expect(page).to have_content(@vortex.is_loop)
      end

      it "shows distance" do
        expect(page).to have_content(@tung_nut.distance)
        expect(page).to have_content(@vortex.distance)
      end

      it "shows difficulty" do
        expect(page).to have_content(@tung_nut.difficulty)
        expect(page).to have_content(@vortex.difficulty)
      end
    end
    #   As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    describe "I see only true records" do
      it "shows only true from boolean column" do
        expect(page).to have_content(@tung_nut.name)
        expect(page).to have_content(@vortex.name)
        expect(page).to_not have_content(@ravine.name)
      end
    end
  end
end