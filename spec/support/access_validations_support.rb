def create_access_validations_dependencies
    # create 3 shipping_companies
    ShippingCompany.create!(brand_name: "ShippingCompany 1 LTDA", corporate_name: "ShippingCompany 1", domain: "shippingcompany1.com", registration_number: "xx.xxx.xxx/ship-01", full_address: "Av Shipping Company 1, 111", status: "Ativo")
    ShippingCompany.create!(brand_name: "ShippingCompany 2 LTDA", corporate_name: "ShippingCompany 2", domain: "shippingcompany2.com", registration_number: "xx.xxx.xxx/ship-02", full_address: "Av Shipping Company 2, 112", status: "Ativo")
    ShippingCompany.create!(brand_name: "ShippingCompany 3 LTDA", corporate_name: "ShippingCompany 3", domain: "shippingcompany3.com", registration_number: "xx.xxx.xxx/ship-03", full_address: "Av Shipping Company 3, 113", status: "Ativo")

    # create 1 User for each shipping_company
    @user_access_validations = User.create!(firstname: "User 1", lastname: "Transportadora 1", email: "transportadora@shippingcompany1.com", password: "123123", password_confirmation: "123123", shipping_company_id: 1)
    @user2_access_validations = User.create!(firstname: "User 2", lastname: "Transportadora 2", email: "transportadora@shippingcompany2.com", password: "123123", password_confirmation: "123123", shipping_company_id: 2)
    User.create!(firstname: "User 3", lastname: "Transportadora 3", email: "transportadora@shippingcompany3.com", password: "123123", password_confirmation: "123123", shipping_company_id: 3)

    # create the price_setting for each shipping_company
    PriceSetting.create!(value_min_cents: 2000, shipping_company_id: 1)
    PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 2)
    PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 3)

    # create 1 prices for each shipping_company
    #1
    Price.create!(cubic_start: 0, cubic_end: 5, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
    #2
    Price.create!(cubic_start: 0, cubic_end: 5, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 2)
    #3
    Price.create!(cubic_start: 0, cubic_end: 5, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 3)

    # create 1 carries for each shipping_company
    Carrier.create!(license_plate: "MER-1111", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: 2015, weight: 500000, shipping_company_id: 1)
    Carrier.create!(license_plate: "FOR-1212", brand: "Ford", code_model: "TRUCK-FORD-12", manufact_year: 2016, weight: 500000, shipping_company_id: 2)
    Carrier.create!(license_plate: "VOL-1313", brand: "Volkswagen", code_model: "TRUCK-VOLK-13", manufact_year: 2017, weight: 500000, shipping_company_id: 3)

    # create 1 DeliveryTime for each shipping_company
    #1
    DeliveryTime.create!(range_start: 0, range_end: 1000, working_day: 4, shipping_company_id: 1)
    #2
    DeliveryTime.create!(range_start: 0, range_end: 1000, working_day: 5, shipping_company_id: 2)
    #3
    DeliveryTime.create!(range_start: 0, range_end: 1000, working_day: 6, shipping_company_id: 3)

    # create 3 OrderService, 3 Receiver, and order_routes for each shipping_company
    #1
    OrderService.create!(status:"Pendente", code: SecureRandom.alphanumeric(15), full_address:"Endereço retirada 1", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
    Receiver.create!(full_address: "Endereço teste 1", first_name:"Nome1", last_name: "Sobrenome1", registration_code: "123123123", order_service_id: 1)
    #2
    OrderService.create!(status:"Aceita", code: SecureRandom.alphanumeric(15), full_address:"Endereço retirada 2", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 2, carrier_id: 2)
    Receiver.create!(full_address: "Endereço do destinatário", first_name:"Nome2", last_name: "Sobrenome2", registration_code: "456456456", order_service_id: 2)
    OrderRoute.create!(current_location: "Endereço teste 2", current_time: Time.now, status:"A caminho", order_service_id: 2)
    OrderRoute.create!(current_location: "Cidate teste 2", current_time: Time.now, status:"A caminho", order_service_id: 2)
    #3
    OrderService.create!(status:"Concluida", code: SecureRandom.alphanumeric(15), full_address:"Endereço retirada 3", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 3, carrier_id: 3)
    Receiver.create!(full_address: "Endereço do destinatário", first_name:"Nome3", last_name: "Sobrenome3", registration_code: "789789789", order_service_id: 3)
    OrderRoute.create!(current_location: "Endereço teste 3", current_time: Time.now, status:"A caminho", order_service_id: 3)
    OrderRoute.create!(current_location: "Cidate teste 3", current_time: Time.now, status:"Concluída", order_service_id: 3)
end
