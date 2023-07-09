require 'rails_helper'

RSpec.describe "trails show", type: :feature do
# As a visitor
# When I visit '/trails/:id'
# Then I see the trail with that id including the trail's attributes
# (data from each column that is on the trails table)
describe "When I visit '/trails/:id'"
  before :each do
    @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
    @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")

    visit "/trails/#{@tung_nut.id}"
  end

  describe "I see the trail with that id and it's attributes" do
    it "shows trail name" do
      expect(page).to have_content(@tung_nut.name)
    end

    it "shows is_loop" do
      expect(page).to have_content(@tung_nut.is_loop)
    end

    it "shows distance" do
      expect(page).to have_content(@tung_nut.distance)
    end

    it "shows difficulty" do
      expect(page).to have_content(@tung_nut.difficulty)
    end
  end

end