# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "-----------------------------------------"
puts "Cadastrando ADMINS..."
Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")
puts "ADMINS cadastrados!"
puts "-----------------------------------------"
puts "Cadastrando SHIPPING_COMPANIES..."
ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
puts "SHIPPING_COMPANIES cadastrados!"
puts "-----------------------------------------"
puts "Cadastrando USERS..."
User.create!(firstname: "User", lastname: "Transportadora", email: "transportadora@acme.com", password: "123123", password_confirmation: "123123", shipping_company_id: 1)
puts "USERS cadastrados!"
puts "-----------------------------------------"
puts "Cadastrando CARRIERS..."
Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)
Carrier.create!(license_plate: "XPL-1515", brand: "Volkswagen", code_model: "TRUCK-WOLK-31", manufact_year: 2021, weight: 4000, shipping_company_id: 1)
puts "CARRIERS cadastrados!"
puts "-----------------------------------------"
puts "Cadastrando PRICES..."
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 30000, value_kilometer_cents: 80, shipping_company_id: 1)
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 100, shipping_company_id: 1)
Price.create!(cubic_start: 0.501, cubic_end: 1.000, weight_start: 0, weight_end: 10000, value_kilometer_cents: 75, shipping_company_id: 1)
puts "PRICES cadastrados!"
puts "-----------------------------------------"
