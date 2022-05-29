require 'rails_helper'

describe "User visit OrderRoutes page" do
    it "and see all routes recorded" do
        # Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)
        OrderRoute.create!(current_location: "Endereço teste de retirada, 1000", current_time: Time.now, status: "A caminho", order_service_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Rotas"

        # Assert
        expect(page).to have_content @order_service_code
        expect(page).to have_content "Endereço teste de retirada, 1000"
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "Aceita"
        expect(page).to have_content "A caminho"
    end

    it "without routes recorded" do
        # Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1, carrier_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Rotas"

        # Assert
        expect(page).to have_content "Não existem rotas cadastradas"
    end
end
