require "rails_helper"

RSpec.describe TrailSystem, type: :model do
  it { should have_many :trails }

  describe "#count_of_trails" do
    it "returns total count of trails for a system" do
      @felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
      @tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")
      @ravine = @felasco.trails.create!(name: "Ravine", is_loop: false, distance: 4, difficulty: "Blue")

      expect(@felasco.count_of_trails).to eq(2)
    end
  end
end