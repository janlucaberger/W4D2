# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
users = []
10.times do
  username = Faker::Internet.user_name
  users << User.create!(username: username)
end


Artwork.destroy_all
artworks = []
5.times do
  begin
    image = Faker::LoremPixel.image("600x400")
    title = Faker::Food.dish
    artist_id = users.sample.id
    artworks << Artwork.create!(img_url: image, title: title, artist_id: artist_id)
  rescue
    retry
  end
end

ArtworkShare.destroy_all
20.times do
  begin
    ArtworkShare.create!(viewer_id: users.sample.id, artwork_id: artworks.sample.id)
  rescue
    retry
  end
end

Comment.destroy_all
comments = []
10.times do
  comments << Comment.create!(description: Faker::FamilyGuy.quote, artwork_id: artworks.sample.id, commenter_id: users.sample.id)
end

Like.destroy_all
30.times do
  Like.create!(likeable_type: "Comment", likeable_id: comments.sample.id, user_id: users.sample.id)
end

30.times do
  Like.create!(likeable_type: "Artwork", likeable_id: artworks.sample.id, user_id: users.sample.id)
end
