require 'rails_helper'

describe "Admin search a new list prices" do
    it "with success" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)
        Carrier.create!(license_plate: "XPL-1515", brand: "Volkswagen", code_model: "TRUCK-WOLK-31", manufact_year: 2021, weight: 4000, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 30000, value_kilometer_cents: 80, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 100, shipping_company_id: 1)
        Price.create!(cubic_start: 0.501, cubic_end: 1.000, weight_start: 0, weight_end: 10000, value_kilometer_cents: 75, shipping_company_id: 1)
        PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: "1"
        fill_in "Altura", with: "1"
        fill_in "Profundidade", with: "1"
        fill_in "Peso", with: "1"
        fill_in "Distância a ser percorrida (km)", with: "20"
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Resultados da busca: 1"
        expect(page).to have_content "ACME LTDA"
        expect(page).to have_content "Domínio: acme.com"
        expect(page).to have_content "CNPJ: xx.xxx.xxx/xxxx-xx"
        expect(page).to have_content "Metros Cúbicos: 1.0 m³"
        expect(page).to have_content "Valor por Km: R$0,75"
        expect(page).to have_content "Valor mínimo cobrado: R$50,00"
        expect(page).to have_link "Gerar ordem de serviço"
    end

    it "with empty fields" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)
        Carrier.create!(license_plate: "XPL-1515", brand: "Volkswagen", code_model: "TRUCK-WOLK-31", manufact_year: 2021, weight: 4000, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 30000, value_kilometer_cents: 80, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 100, shipping_company_id: 1)
        Price.create!(cubic_start: 0.501, cubic_end: 1.000, weight_start: 0, weight_end: 10000, value_kilometer_cents: 75, shipping_company_id: 1)
        PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: ""
        fill_in "Altura", with: ""
        fill_in "Profundidade", with: ""
        fill_in "Peso", with: ""
        fill_in "Distância a ser percorrida (km)", with: ""
        click_on "Buscar"

        # Assert
        expect(page).to have_content "A busca não pode ser realizada. Os campos Largura, Altura, Profundidade, Peso, Distância a ser percorrida (km) não podem ficar em branco."
        expect(page).to have_content "Formulário de busca"
    end

    it "but can't find any results" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)
        Carrier.create!(license_plate: "XPL-1515", brand: "Volkswagen", code_model: "TRUCK-WOLK-31", manufact_year: 2021, weight: 4000, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 30000, value_kilometer_cents: 80, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 30000, weight_end: 9999999, value_kilometer_cents: 100, shipping_company_id: 1)
        Price.create!(cubic_start: 0.501, cubic_end: 1.000, weight_start: 0, weight_end: 10000, value_kilometer_cents: 75, shipping_company_id: 1)
        PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: "200"
        fill_in "Altura", with: "200"
        fill_in "Profundidade", with: "200"
        fill_in "Peso", with: "500"
        fill_in "Distância a ser percorrida (km)", with: "389"
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Resultados da busca: 0"
        expect(page).to have_content "Não há transportadora para atender esta demanda."
    end

    it "with success and finded more than one result" do
        # Arrange
        create_new_admin
        create_new_search_dependencies

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: 0.1
        fill_in "Altura", with: 0.1
        fill_in "Profundidade", with: 0.1
        fill_in "Peso", with: 1
        fill_in "Distância a ser percorrida (km)", with: 40
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Resultados da busca: 3"
    end

    it "with success and border test" do
        # Arrange
        create_new_admin
        create_new_search_with_border_test

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: 1
        fill_in "Altura", with: 1
        fill_in "Profundidade", with: 1
        fill_in "Peso", with: 1
        fill_in "Distância a ser percorrida (km)", with: 1
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Resultados da busca: 1"
        expect(page).to have_content "Razão social: ShippingCompany 2"
        expect(page).to have_content "Domínio: shippingcompany2.com"
        expect(page).to have_content "CNPJ: xx.xxx.xxx/ship-02"
        expect(page).to have_content "Metros Cúbicos: 1.0 m³"
        expect(page).to have_content "Prazo de entrega: 5 dias úteis"
        expect(page).to have_content "Valor Total: R$1,00"
    end
    
end
