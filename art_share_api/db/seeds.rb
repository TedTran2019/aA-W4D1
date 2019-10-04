# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: "Ted")
User.create!(username: "Steven")
User.create!(username: "Poitier")
Artwork.create!(title: "First ted", image_url: "tfirst.com", artist_id: 1)
Artwork.create!(title: "Second ted", image_url: "tsecond.com", artist_id: 1)
Artwork.create!(title: "First steven", image_url: "sfirst.com", artist_id: 2)
ArtworkShare.create!(viewer_id: 1, artwork_id: 1)
ArtworkShare.create!(viewer_id: 1, artwork_id: 2)
ArtworkShare.create!(viewer_id: 2, artwork_id: 1)
