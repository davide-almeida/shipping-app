def create_new_shipping_company
    ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
end

def create_new_shipping_company_with_3_carriers
    ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
    Carrier.create!(license_plate: "MER-1111", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: 2015, weight: 500000, shipping_company_id: 1)
    Carrier.create!(license_plate: "FOR-1212", brand: "Ford", code_model: "TRUCK-FORD-12", manufact_year: 2016, weight: 800000, shipping_company_id: 1)
    Carrier.create!(license_plate: "VOL-1313", brand: "Volkswagen", code_model: "TRUCK-VOLK-13", manufact_year: 2017, weight: 1000000, shipping_company_id: 1)
end