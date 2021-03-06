# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "-----------------------------------------"

puts "Adding ADMINS..."
Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")
puts "ADMINS Added!"

puts "-----------------------------------------"

puts "Adding ShippingCompanies..."
# create 3 shipping_companies
ShippingCompany.create!(brand_name: "ShippingCompany 1 LTDA", corporate_name: "ShippingCompany 1", domain: "shippingcompany1.com", registration_number: "xx.xxx.xxx/ship-01", full_address: "Av Shipping Company 1, 111", status: "Ativo")
ShippingCompany.create!(brand_name: "ShippingCompany 2 LTDA", corporate_name: "ShippingCompany 2", domain: "shippingcompany2.com", registration_number: "xx.xxx.xxx/ship-02", full_address: "Av Shipping Company 2, 112", status: "Ativo")
ShippingCompany.create!(brand_name: "ShippingCompany 3 LTDA", corporate_name: "ShippingCompany 3", domain: "shippingcompany3.com", registration_number: "xx.xxx.xxx/ship-03", full_address: "Av Shipping Company 3, 113", status: "Ativo")
puts "ShippingCompanies Added!"

puts "-----------------------------------------"

puts "Adding Carriers..."
# create 1 carries for each shipping_company
Carrier.create!(license_plate: "MER-1111", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: 2015, weight: 500000, shipping_company_id: 1)
Carrier.create!(license_plate: "FOR-1212", brand: "Ford", code_model: "TRUCK-FORD-12", manufact_year: 2016, weight: 500000, shipping_company_id: 2)
Carrier.create!(license_plate: "VOL-1313", brand: "Volkswagen", code_model: "TRUCK-VOLK-13", manufact_year: 2017, weight: 500000, shipping_company_id: 3)
puts "Carriers Added!"

puts "-----------------------------------------"

puts "Adding Prices..."
# create 4 prices for each shipping_company
#1
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 30000, value_kilometer_cents: 80, shipping_company_id: 1)
Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 100, shipping_company_id: 1)
Price.create!(cubic_start: 0.501, cubic_end: 1.000, weight_start: 0, weight_end: 10000, value_kilometer_cents: 75, shipping_company_id: 1)
#2
Price.create!(cubic_start: 0.001, cubic_end: 0.600, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 2)
Price.create!(cubic_start: 0.001, cubic_end: 0.600, weight_start: 10000, weight_end: 40000, value_kilometer_cents: 80, shipping_company_id: 2)
Price.create!(cubic_start: 0.6, cubic_end: 1.0, weight_start: 20000, weight_end: 9999999, value_kilometer_cents: 110, shipping_company_id: 2)
Price.create!(cubic_start: 1.0, cubic_end: 2, weight_start: 0, weight_end: 30000, value_kilometer_cents: 150, shipping_company_id: 2)
#3
Price.create!(cubic_start: 0.001, cubic_end: 0.600, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 3)
Price.create!(cubic_start: 0.001, cubic_end: 0.600, weight_start: 10000, weight_end: 40000, value_kilometer_cents: 80, shipping_company_id: 3)
Price.create!(cubic_start: 0.7, cubic_end: 1.1, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 110, shipping_company_id: 3)
Price.create!(cubic_start: 1.1, cubic_end: 3, weight_start: 0, weight_end: 40000, value_kilometer_cents: 180, shipping_company_id: 3)
puts "Prices Added!"

puts "-----------------------------------------"

puts "Adding PriceSettings..."
# create the price_setting for each shipping_company
PriceSetting.create!(value_min_cents: 2000, shipping_company_id: 1)
PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 2)
PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 3)
puts "PriceSettings Added!"

puts "-----------------------------------------"

puts "Adding DeliveryTimes..."
# create 3 DeliveryTime for each shipping_company
#1
DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)
DeliveryTime.create!(range_start: 101, range_end: 200, working_day: 8, shipping_company_id: 1)
DeliveryTime.create!(range_start: 201, range_end: 300, working_day: 16, shipping_company_id: 1)
#2
DeliveryTime.create!(range_start: 0, range_end: 90, working_day: 4, shipping_company_id: 2)
DeliveryTime.create!(range_start: 91, range_end: 190, working_day: 8, shipping_company_id: 2)
DeliveryTime.create!(range_start: 191, range_end: 300, working_day: 16, shipping_company_id: 2)
#3
DeliveryTime.create!(range_start: 0, range_end: 110, working_day: 4, shipping_company_id: 3)
DeliveryTime.create!(range_start: 111, range_end: 210, working_day: 8, shipping_company_id: 3)
DeliveryTime.create!(range_start: 211, range_end: 500, working_day: 20, shipping_company_id: 3)
puts "DeliveryTimes Added!"

puts "-----------------------------------------"

puts "Adding USERS..."
User.create!(firstname: "User 1", lastname: "Transportadora 1", email: "transportadora@shippingcompany1.com", password: "123123", password_confirmation: "123123", shipping_company_id: 1)
User.create!(firstname: "User 2", lastname: "Transportadora 2", email: "transportadora@shippingcompany2.com", password: "123123", password_confirmation: "123123", shipping_company_id: 2)
User.create!(firstname: "User 3", lastname: "Transportadora 3", email: "transportadora@shippingcompany3.com", password: "123123", password_confirmation: "123123", shipping_company_id: 3)
puts "USERS Added!"

