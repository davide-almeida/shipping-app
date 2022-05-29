require 'rails_helper'

describe "Cliente use the track_search form" do
    it "with success" do
        # Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)
        OrderRoute.create!(current_location: "Endereço teste de retirada, 1000", current_time: Time.now, status: "A caminho", order_service_id: 1)
        
        # Act
        visit root_path
        click_on "Rastreio"
        fill_in "Digite o código para rastreio", with: @order_service_code
        click_on "Buscar"

        # Assert
        expect(page).to have_content "A caminho"
        expect(page).to have_content "Endereço teste de retirada, 1000"
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "MER-1111"
        expect(page).to have_content @order_service_code
    end

    it "with wrong code" do
        # Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)
        OrderRoute.create!(current_location: "Endereço teste de retirada, 1000", current_time: Time.now, status: "A caminho", order_service_id: 1)
        
        # Act
        visit root_path
        click_on "Rastreio"
        fill_in "Digite o código para rastreio", with: "asda"
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Código não encontrado."
    end

    it "when order_service.status is 'Pendente'." do
        # Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)
        
        # Act
        visit root_path
        click_on "Rastreio"
        fill_in "Digite o código para rastreio", with: @order_service_code
        click_on "Buscar"

        # Assert
        expect(page).to have_content "Código não encontrado."
    end
end
