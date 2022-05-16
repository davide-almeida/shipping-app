# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "-----------------------------------------"
puts "Cadastrando ADMINS..."
Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")
puts "ADMINS cadastrados!"
puts "-----------------------------------------"