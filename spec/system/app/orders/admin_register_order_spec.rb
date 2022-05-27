require 'rails_helper'

describe "Admin register a new order" do
    it "with success" do
        # Arrange
        create_new_admin
        @shipping_company = ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 50000, shipping_company_id: 1)
        Price.create!(cubic_start: 0.001, cubic_end: 1.0, weight_start: 0, weight_end: 50000, value_kilometer_cents: 50, shipping_company_id: 1)
        PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: "1"
        fill_in "Altura", with: "1"
        fill_in "Profundidade", with: "1"
        fill_in "Peso", with: "5"
        fill_in "Distância a ser percorrida (km)", with: "10"
        click_on "Buscar"
        click_on "Gerar ordem de serviço"
        fill_in "Endereço completo", with: "Av endereço de retirada, 100"
        fill_in "Primeiro nome", with: "Firstname Destinatário"
        fill_in "Sobrenome", with: "Lastname Destinatário"
        fill_in "RG", with: "123123123"
        fill_in "Endereço completo (destinatário)", with: "Avenida endereço do destinatário"
        click_on "Cadastrar"

        # got order code (because is generate automatically)
        @order_code = @shipping_company.orders.last.code

        # Assert
        expect(page).to have_content "Ordem de serviço cadastrada com sucesso."
        expect(page).to have_content "Código: #{@order_code}"
        expect(page).to have_content "Status: Pendente"
        expect(page).to have_content "Transportadora: ACME"
        expect(page).to have_content "Endereço de retirada: Av endereço de retirada, 100"
        expect(page).to have_content "Distância a ser percorrida: 10.0 km"
        expect(page).to have_content "Largura: 1.0"
        expect(page).to have_content "Altura: 1.0"
        expect(page).to have_content "Profundidade: 1.0"
        expect(page).to have_content "Peso: 5.0kg"
        expect(page).to have_content "Valor total: R$50,00"
        expect(page).to have_content "Destinatário: Firstname Destinatário Lastname Destinatário"
        expect(page).to have_content "RG: 123123123"
        expect(page).to have_content "Endereço de entrega: Avenida endereço do destinatário"
    end
end
