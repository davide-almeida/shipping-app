def create_new_carriers_with_1g
    Carrier.create!(license_plate: "MER-1111", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: 2015, weight: 1, shipping_company_id: 1)
    Carrier.create!(license_plate: "FOR-1212", brand: "Ford", code_model: "TRUCK-FORD-12", manufact_year: 2016, weight: 1, shipping_company_id: 1)
end

def create_new_carrier
    Carrier.create!(license_plate: "MER-1111", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: 2015, weight: 500000, shipping_company_id: 1)
end
