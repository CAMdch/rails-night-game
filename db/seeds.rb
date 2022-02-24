# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   games = Games.create([{name:'Monopoly'})
require "open-uri"

# puts delete allusers
# delete tout users, tout games, tout bookings
# créer un user
# créer un jeu,assigner à ce jeu un utilisateur
# créer un booking
puts "Deleting all bookings"
Booking.destroy_all

puts "Deleting all reviews"
Review.destroy_all

puts "Deleting all games"
Game.destroy_all

puts "Deleting all users"
User.destroy_all

puts "Deleting all favorites"
Favorite.destroy_all

puts "Creating users"

photo_alexis = URI.open('https://previews.123rf.com/images/yupiramos/yupiramos1705/yupiramos170509105/77704043-personnage-d-avatar-jeune-homme-conception-d-illustration-vectorielle-isom%C3%A9trique.jpg')
alexis = User.new(name: "Alexis Sion", email: "alexis@gmail.com", phone: "0611223344", password: "azerty")
alexis.photo.attach(io: photo_alexis, filename: 'alexis-image.jpg', content_type: 'image/jpg')
alexis.save!
camille = User.new(name: "Camille Dauchy", email: "camille@gmail.com", phone: "0622334455", password: "azerty")
camille.save!
emily = User.new(name: "Emily Haynes", email: "emily@gmail.com", phone: "0633445566", password: "azerty")
emily.save!

puts "#{User.count} User Created !"

puts "Creating games"

photo_root = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg')
root = Game.new( name: "Root", description: "Find adventure in this marvelous asymmetric game.", price: "5€", min_player:"2", max_player:"4" , playtime:"60min" , address: "2 Avenue Des Saules, 59160 Lille, France" , user: alexis )
root.photos.attach(io: photo_root, filename: 'root-image.jpg', content_type: 'image/jpg')
root.save!

photo_scythe = URI.open('https://cdn.shopify.com/s/files/1/0513/4077/1515/products/scythe-board-game.jpg')
scythe = Game.new( name: "Scythe", description: "Scythe gives players almost complete control over their fate. ", price: "4€", min_player:"1", max_player: "5", playtime: "90min", address:"Rue De Wattiessart, 59113 Seclin, France", user: alexis)
scythe.photos.attach(io: photo_scythe, filename: 'scythe-image.jpg', content_type: 'image/jpg')
scythe.save!

photo_terraforming_mars = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324032557.jpg')
terraforming_mars = Game.new( name: "Terraforming Mars", description: "In the 2400s, mankind begins to terraform the planet Mars.", price: "6€", min_player:"2", max_player: "5", playtime: "90min", address: "Avenue De La République, 59700 Marcq-en-Barœul, France" , user: alexis)
terraforming_mars.photos.attach(io: photo_terraforming_mars, filename: 'terraforming_mars-image.jpg', content_type: 'image/jpg')
terraforming_mars.save!

photo_pandemic = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1559254186140-51iNoyxoamL.jpg')
pandemic = Game.new( name: "Pandemic", description: "After five years of Pandemic, hundreds of thousands of players have contracted the virus!", price: "3€", min_player:"2", max_player: "4", playtime: "45min", address: "Rue Faidherbe, 59139 Wattignies, France" , user: camille)
pandemic.photos.attach(io: photo_pandemic, filename: 'pandemic-image.jpg', content_type: 'image/jpg')
pandemic.save!

photo_wingspan = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629325193747.png')
wingspan = Game.new( name: "Wingspan", description: "Wingspan is a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games.", price: "5€", min_player:"2", max_player:"4" , playtime:"40min" , address: "2 Rue Auber, 59800 Lille, France" , user: camille )
wingspan.photos.attach(io: photo_wingspan, filename: 'wingspan-image.png', content_type: 'image/png')
wingspan.save!

photo_viticulture = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629323034692.jpg')
viticulture = Game.new( name: "Viticulture", description: "Viticulture is a worker-placement game set in the foothills of Tuscany. ", price: "7€", min_player:"1", max_player:"6" , playtime:"120min" , address: "Rue Royale, 59800 Lille, France" , user: camille )
viticulture.photos.attach(io: photo_viticulture, filename: 'viticulture-image.jpg', content_type: 'image/jpg')
viticulture.save!


puts " #{Game.count}Game Created !"


booking_1 = Booking.new(user: emily, game: root, date_begin: Date.today,date_end: Date.today + 3)
booking_1.save!
booking_2 = Booking.new(user: emily, game: pandemic, date_begin: Date.today + 5,date_end: Date.today + 9)
booking_2.save!


puts " #{Booking.count}Booking Created !"
