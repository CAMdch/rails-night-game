# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   games = Games.create([{name:'Monopoly'})

# puts delete allusers
# delete tout users, tout games, tout bookings
# créer un user
# créer un jeu,assigner à ce jeu un utilisateur
# créer un booking
puts "Delete all bookings"
Booking.destroy_all

puts "Delete all games"
Game.destroy_all

puts "Delete all users"
User.destroy_all

puts "Creating users"
alexis = User.create(name: "Alexis Sion", email: "alexis@gmail.com", phone: "0611223344", password: "azerty")
camille = User.create(name: "Camille Dauchy", email: "camille@gmail.com", phone: "0622334455", password: "azerty")
emily = User.create(name: "Emily Haynes", email: "emily@gmail.com", phone: "0633445566", password: "azerty")

puts "#{User.count} User Created !"

puts "Creating games"
root = Game.create(name: "Root", description: "Find adventure in this marvelous asymmetric game.", price: "5€", min_player:"2", max_player:"4" , playtime:"60min" , address: "Lille" , user: alexis )
scythe = Game.create(name: "Scythe", description: "Scythe gives players almost complete control over their fate. ", price: "4€", min_player:"1", max_player: "5", playtime: "90min", address:"Lomme", user: alexis)
terraforming_mars = Game.create(name: "Terraforming Mars", description: "In the 2400s, mankind begins to terraform the planet Mars.", price: "6€", min_player:"2", max_player: "5", playtime: "90min", address: "Mouvaux" , user: alexis)
pandemic = Game.create(name: "Pandemic", description: "After five years of Pandemic, hundreds of thousands of players have contracted the virus!", price: "3€", min_player:"2", max_player: "4", playtime: "45min", address: "Croix" , user: camille)
wingspan = Game.create(name: "Wingspan", description: "Wingspan is a competitive, medium-weight, card-driven, engine-building board game from Stonemaier Games.", price: "5€", min_player:"2", max_player:"4" , playtime:"40min" , address: "Lille" , user: camille )

puts " #{Game.count}Game Created !"

booking_1 = Booking.create!(user: emily, game: root, date_begin: Date.today,date_end: Date.today + 3)
booking_2 = Booking.create!(user: emily, game: pandemic, date_begin: Date.today + 5,date_end: Date.today + 9)

puts " #{Booking.count}Booking Created !"
