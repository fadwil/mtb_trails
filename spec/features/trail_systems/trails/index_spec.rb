require "rails_helper"

# trail_systems trails index page
RSpec.describe "/trail_systems/:id/trails", type: :feature do
  # As a visitor
  # When I visit '/trail_systems/:id/trails'
  # Then I see each Trail that is associated with that Trail System with each trail's attributes
  # (data from each column that is on the trails table)
  describe "When I visit '/trail_systems/:id/trails" do
    before :each do
      @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
      @santos = TrailSystem.create!(name: "Santos", has_fee: false, highest_trailhead: 241)

      @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")
      @ravine = @felasco.trails.create!(name: "Ravine", is_loop: false, distance: 4, difficulty: "Blue")
      @vortex = @santos.trails.create!(name: "Vortex", is_loop: true, distance: 3, difficulty: "Black")

      visit "/trail_systems/#{@felasco.id}/trails"
    end

    describe "I see each Trail that is associated with that Trail System with each trail's attribute" do
      it "shows trails name" do
        expect(page).to have_content(@tung_nut.name)
        expect(page).to have_content(@ravine.name)
        expect(page).to_not have_content(@vortex.name)

      end

      it "shows trails is_loop" do
        expect(page).to have_content(@tung_nut.is_loop)
        expect(page).to have_content(@ravine.is_loop)
        # expect(page).to_not have_content(@vortex.is_loop)
      end

      it "shows trails distance" do
        expect(page).to have_content(@tung_nut.distance)
        expect(page).to have_content(@ravine.distance)
        expect(page).to_not have_content(@vortex.distance)
      end

      it "shows trails difficulty" do
        expect(page).to have_content(@tung_nut.difficulty)
        expect(page).to have_content(@ravine.difficulty)
        expect(page).to_not have_content(@vortex.difficulty)
      end
    end
  end
end 
