require 'rails_helper'

RSpec.describe "/trails/:id/edit", type: :feature do
  before :each do 
    @pisgah = TrailSystem.create!(name: "Pisgah", has_fee: false, highest_trailhead: 6399)
    @avery_creek = @pisgah.trails.create!(name: "Avery Creek", is_loop: false, distance: 3, difficulty: "Black")
  end
  # As a visitor
  # When I visit a TrailShow page
  # Then I see a link to update that Trail "Update Trail"
  # When I click the link
  # I am taken to '/trails/:id/edit' where I see a form to edit the trail's attributes:
  # When I click the button to submit the form "Update Trail"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the trail's data is updated,
  # and I am redirected to the Trail Show page where I see the Trail's updated information
  describe "I see a link to update the trail 'Update Trail'" do
    it "links to the edit page" do
      visit "/trails/#{@avery_creek.id}"
      expect(page).to have_link("Update Trail", href: "/trails/#{@avery_creek.id}/edit")
    end

    it "when I click the link I am taken to '/trails/:id/edit' where I see a form to edit the trail's attributes" do
      visit "/trails/#{@avery_creek.id}"

      click_link  "Update Trail"

      expect(current_path).to eq("/trails/#{@avery_creek.id}/edit")
    end
  end

  describe "When I fill out the form with the updated info and submit the trails info is updated" do
    it "updates the trail info and redirects to the trails show page" do
      visit "/trails/#{@avery_creek.id}/edit"

      fill_in "Name", with: "avery creek"
      click_button "Update Trail"

      expect(current_path).to eq("/trails/#{@avery_creek.id}")
      expect(page).to have_content("avery creek")
    end
  end
end