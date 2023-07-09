# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@felasco = TrailSystem.create!(name: "San Felasco", has_fee: true, highest_trailhead: 234)
@santos = TrailSystem.create!(name: "Santos", has_fee: false, highest_trailhead: 241)
@pisgah = TrailSystem.create!(name: "Pisgah", has_fee: false, highest_trailhead: 6399)

@tung_nut = @felasco.trails.create!(name: "Tung Nut", is_loop: true, distance: 2, difficulty: "Blue")
@ravine = @felasco.trails.create!(name: "Ravine", is_loop: false, distance: 4, difficulty: "Blue")

@vortex = @santos.trails.create!(name: "Vortex", is_loop: true, distance: 3, difficulty: "Black")
@marshmallow = @santos.trails.create!(name: "Marshmallow", is_loop: false, distance: 3, difficulty: "Green")

@avery_creek = @pisgah.trails.create!(name: "Avery Creek", is_loop: false, distance: 3, difficulty: "Black")
@daniel_ridge = @pisgah.trails.create!(name: "Daniel Ridge", is_loop: true, distance: 4, difficulty: "Black")
