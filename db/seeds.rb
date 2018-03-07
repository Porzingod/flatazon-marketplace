# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "master", email: "master", password: "master", password_confirmation: "master", addresses_attributes:[street_address_1: "master", street_address_2: "master", city: "master", state: "master", zipcode: "10004", address_type: "master"])
User.create(username: "jason", email: "jason", password: "jason", password_confirmation: "jason", balance: 100000, addresses_attributes:[street_address_1: "jason", street_address_2: "jason", city: "jason", state: "jason", zipcode: "11209", address_type: "jason"])
User.create(username: "ryan", email: "ryan", password: "ryan", password_confirmation: "ryan", balance: 100000, addresses_attributes:[street_address_1: "ryan", street_address_2: "ryan", city: "ryan", state: "ryan", zipcode: "11209", address_type: "ryan"])

categories = ["Books and Audible", "Movies, Music and Games", "Electronics, Computers and Office", "Home, Garden, Pets and Tools", "Restaurant, Food and Grocery", "Beauty and Health", "Toys, Kids and Baby", "Clothing, Shoes and Jewelry", "Handmade", "Sports and Outdoors", "Automotive and Industrial"]

categories.each {|cat| Category.create(name: cat)}

item_keys = ["name", "price", "quantity", "category", "user"]
items = [
  ["Harry Potter and the Prisoner of Flatiron", 39, 20, Category.find_by(name: "Books and Audible"), User.find(1)],
  ["The Coding Bible", 10, 30, Category.find_by(name: "Books and Audible"), User.find(1)],
  ["Water Boy", 5, 10, Category.find_by(name: "Movies, Music and Games"), User.find(1)],
  ["DAMN.", 20, 50, Category.find_by(name: "Movies, Music and Games"), User.find(1)],
  ["Ass Effect 3", 30, 8, Category.find_by(name: "Movies, Music and Games"), User.find(1)],
  ["iPod Classic", 20, 3, Category.find_by(name: "Electronics, Computers and Office"), User.find(1)],
  ["GTX 2020", 1000, 4, Category.find_by(name: "Electronics, Computers and Office"), User.find(1)],
  ["Printing Paper 200 ct", 12, 50, Category.find_by(name: "Electronics, Computers and Office"), User.find(1)],
  ["Mirror", 50, 10, Category.find_by(name: "Home, Garden, Pets and Tools"), User.find(1)],
  ["Shovel", 18, 30, Category.find_by(name: "Home, Garden, Pets and Tools"), User.find(1)],
  ["Dog Chew Toy", 4, 20, Category.find_by(name: "Home, Garden, Pets and Tools"), User.find(1)],
  ["Ultra White Paint", 13, 20, Category.find_by(name: "Home, Garden, Pets and Tools"), User.find(1)],
  ["Dining Set - Set of 4", 20, 20, Category.find_by(name: "Restaurant, Food and Grocery"), User.find(1)],
  ["Assorted Chocolates 1000 ct", 30, 20, Category.find_by(name: "Restaurant, Food and Grocery"), User.find(1)],
  ["Brocolli", 1, 20, Category.find_by(name: "Restaurant, Food and Grocery"), User.find(1)],
  ["Makeup", 30, 20, Category.find_by(name: "Beauty and Health"), User.find(1)],
  ["Dentures", 12, 24, Category.find_by(name: "Beauty and Health"), User.find(1)],
  ["Fidget Spinner", 3, 80, Category.find_by(name: "Toys, Kids and Baby"), User.find(1)],
  ["8 Year Old", 10000, 1, Category.find_by(name: "Toys, Kids and Baby"), User.find(1)],
  ["1 Year Old", 40000, 1, Category.find_by(name: "Toys, Kids and Baby"), User.find(1)],
  ["T-Shirt", 4, 90, Category.find_by(name: "Clothing, Shoes and Jewelry"), User.find(1)],
  ["Jordan 99", 280, 23, Category.find_by(name: "Clothing, Shoes and Jewelry"), User.find(1)],
  ["\"Diamond\"", 1000, 60, Category.find_by(name: "Clothing, Shoes and Jewelry"), User.find(1)],
  ["Basket", 100, 10, Category.find_by(name: "Handmade"), User.find(1)],
  ["Basketsball", 17, 20, Category.find_by(name: "Sports and Outdoors"), User.find(1)],
  ["Rock", 1, 99, Category.find_by(name: "Sports and Outdoors"), User.find(1)],
  ["Car Horn", 15, 20, Category.find_by(name: "Automotive and Industrial"), User.find(1)],
  ["Monkey Wrench", 10, 35, Category.find_by(name: "Automotive and Industrial"), User.find(1)],
]

items.each do |item|
  new_item = Item.new
  item.each_with_index do |attribute, i|
    new_item.send(item_keys[i]+"=", attribute)
  end
  new_item.save
end
