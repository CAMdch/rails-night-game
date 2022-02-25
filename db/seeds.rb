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

photo_alexis = URI.open('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
alexis = User.new(name: "Alexis Sion", email: "alexis@gmail.com", phone: "0611223344", password: "azerty")
alexis.photo.attach(io: photo_alexis, filename: 'alexis-image.jpg', content_type: 'image/jpg')
alexis.save!
photo_camille = URI.open('https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=895&q=80')
camille = User.new(name: "Camille Dauchy", email: "camille@gmail.com", phone: "0622334455", password: "azerty")
camille.photo.attach(io: photo_camille, filename: 'camille-image.jpg', content_type: 'image/jpg')
camille.save!
photo_emily = URI.open('https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80')
emily = User.new(name: "Emily Haynes", email: "emily@gmail.com", phone: "0633445566", password: "azerty")
emily.photo.attach(io: photo_emily, filename: 'emily-image.jpg', content_type: 'image/jpg')
emily.save!

puts "#{User.count} User Created !"

puts "Creating games"

photo_risk = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1559254847937-51zyVWbt8aL.jpg')
photo_risk2 = URI.open('https://cdn.shopify.com/s/files/1/1704/1809/products/b74e4399ce7d2b7aa6d1cd7dfd199f5c1d5ced6c_1024x1024.jpg')
photo_risk3 = URI.open('https://m.media-amazon.com/images/I/91hza4UvatL._AC_SL1500_.jpg')
risk = Game.new(name: "Risk", description: "Welcome to the world of Risk. It’s exciting. It’s unpredictable. It’s all about battling your way to global domination, one territory at a time. And it’s easy to get into the game, fast! ", price: "5€", min_player:"2", max_player:"6" , playtime:"120min" , address: "14 Rue Frédéric Chopin, Lens" , user: emily )
risk.photos.attach(io: photo_risk, filename: 'risk-image.jpg', content_type: 'image/jpg')
risk.photos.attach(io: photo_risk2, filename: 'risk-image2.jpg', content_type: 'image/jpg')
risk.photos.attach(io: photo_risk3, filename: 'risk-image3.jpg', content_type: 'image/jpg')
risk.save!

photo_root = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg')
photo_root2 = URI.open('https://cdn.shopify.com/s/files/1/0029/2683/7830/products/Card-Fan-Hi-rez_1800x1385.jpg')
root = Game.new(name: "Root", description: "Find adventure in this marvelous asymmetric game.", price: "5€", min_player:"2", max_player:"4" , playtime:"60min" , address: "27 Rue d'Eylau, Lille" , user: alexis )
root.photos.attach(io: photo_root, filename: 'root-image.jpg', content_type: 'image/jpg')
root.photos.attach(io: photo_root2, filename: 'root-image2.jpg', content_type: 'image/jpg')
root.save!

photo_scythe = URI.open('https://cdn.shopify.com/s/files/1/0513/4077/1515/products/scythe-board-game.jpg')
photo_scythe2 = URI.open('https://i.ebayimg.com/images/g/N3UAAOSw0EVhEHtf/s-l1600.jpg')
photo_scythe3 = URI.open('https://i.ebayimg.com/images/g/jRIAAOSwpDVhEHth/s-l1600.jpg')
scythe = Game.new(name: "Scythe", description: "Scythe gives players almost complete control over their fate. ", price: "4€", min_player:"1", max_player: "5", playtime: "90min", address:"5 Rue du Paradis, Lomme", user: alexis)

scythe.photos.attach(io: photo_scythe, filename: 'scythe-image.jpg', content_type: 'image/jpg')
scythe.photos.attach(io: photo_scythe2, filename: 'scythe-image2.jpg', content_type: 'image/jpg')
scythe.photos.attach(io: photo_scythe3, filename: 'scythe-image3.jpg', content_type: 'image/jpg')
scythe.save!

photo_terraforming_mars = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324032557.jpg')

photo_terraforming_mars2 = URI.open('https://m.media-amazon.com/images/I/81c0G0Ny15L._AC_SL1500_.jpg')
photo_terraforming_mars3 = URI.open('https://m.media-amazon.com/images/I/71egab-6cpL._AC_SL1500_.jpg')
terraforming_mars = Game.new(name: "Terraforming Mars", description: "In the 2400s, mankind begins to terraform the planet Mars.", price: "6€", min_player:"2", max_player: "5", playtime: "90min", address: "33 Rue de Bir Hakeim, Mouvaux" , user: alexis)
terraforming_mars.photos.attach(io: photo_terraforming_mars, filename: 'terraforming_mars-image.jpg', content_type: 'image/jpg')
terraforming_mars.photos.attach(io: photo_terraforming_mars2, filename: 'terraforming_mars-image2.jpg', content_type: 'image/jpg')
terraforming_mars.photos.attach(io: photo_terraforming_mars3, filename: 'terraforming_mars-image3.jpg', content_type: 'image/jpg')
terraforming_mars.save!

photo_pandemic = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1559254186140-51iNoyxoamL.jpg')

photo_pandemic2 = URI.open('https://m.media-amazon.com/images/I/81k-KSydlzL._AC_SL1500_.jpg')
photo_pandemic3 = URI.open('https://m.media-amazon.com/images/I/817H2dO3ZAL._AC_SL1500_.jpg')
pandemic = Game.new(name: "Pandemic", description: "After five years of Pandemic, hundreds of thousands of players have contracted the virus!", price: "3€", min_player:"2", max_player: "4", playtime: "45min", address: "36 Rue Napoléon Bonaparte, Halluin" , user: camille)
pandemic.photos.attach(io: photo_pandemic, filename: 'pandemic-image.jpg', content_type: 'image/jpg')
pandemic.photos.attach(io: photo_pandemic2, filename: 'pandemic-image2.jpg', content_type: 'image/jpg')
pandemic.photos.attach(io: photo_pandemic3, filename: 'pandemic-image3.jpg', content_type: 'image/jpg')
pandemic.save!

photo_wingspan = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629325193747.png')
photo_wingspan2 = URI.open('https://m.media-amazon.com/images/I/817hD8DD--L._AC_SL1500_.jpg')
wingspan = Game.new(name: "Wingspan", description: "Wingspan is a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games.", price: "5€", min_player:"2", max_player:"4" , playtime:"40min" , address: "2 Rue d'Iéna, Lille" , user: camille )
wingspan.photos.attach(io: photo_wingspan, filename: 'wingspan-image.png', content_type: 'image/png')
wingspan.photos.attach(io: photo_wingspan2, filename: 'wingspan-image2.png', content_type: 'image/png')
wingspan.save!

photo_viticulture = URI.open('https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629323034692.jpg')
photo_viticulture2 = URI.open('https://m.media-amazon.com/images/I/91agN1wMA1L._AC_SL1500_.jpg')
photo_viticulture3 = URI.open('https://m.media-amazon.com/images/I/91YThxllzHL._AC_SL1500_.jpg')
viticulture = Game.new(name: "Viticulture", description: "Viticulture is a worker-placement game set in the foothills of Tuscany. ", price: "7€", min_player:"1", max_player:"6" , playtime:"120min" , address: "22 Rue de Wagram,Tourcoing" , user: camille )
viticulture.photos.attach(io: photo_viticulture, filename: 'viticulture-image.jpg', content_type: 'image/jpg')
viticulture.photos.attach(io: photo_viticulture2, filename: 'viticulture-image2.jpg', content_type: 'image/jpg')
viticulture.photos.attach(io: photo_viticulture3, filename: 'viticulture-image3.jpg', content_type: 'image/jpg')
viticulture.save!


photo_monopoly = URI.open('https://www.cdiscount.com/pdt2/1/2/1/1/700x700/has0001055920121/rw/hasbro-monopoly-millionaire-fast-traitant-de-la.jpg')
photo_monopoly2 = URI.open('https://m.media-amazon.com/images/I/81bSjjopW8L._AC_SL1500_.jpg')
photo_monopoly3 = URI.open('https://m.media-amazon.com/images/I/81Bw6pPQ4UL._AC_SL1000_.jpg')
monopoly = Game.new(name: "Monopoly Millionaire", description: "The thrill of bankrupting an opponent, the possibility of playing a 9 hour game, and the absolution between winning and losing, could change with the roll of the dice.", price: "4€", min_player:"2", max_player:"8" , playtime:"300min" , address: "11 Rue d'Austerlitz, Halluin" , user: emily )
monopoly.photos.attach(io: photo_monopoly, filename: 'monopoly-image.jpg', content_type: 'image/jpg')
monopoly.photos.attach(io: photo_monopoly2, filename: 'monopoly-image2.jpg', content_type: 'image/jpg')
monopoly.photos.attach(io: photo_monopoly3, filename: 'monopoly-image3.jpg', content_type: 'image/jpg')
monopoly.save!





puts " #{Game.count}Game Created !"


booking_1 = Booking.new(user: emily, game: root, date_begin: Date.today,date_end: Date.today + 3)
booking_1.save!
booking_2 = Booking.new(user: emily, game: pandemic, date_begin: Date.today + 5,date_end: Date.today + 9)
booking_2.save!


puts " #{Booking.count}Booking Created !"
