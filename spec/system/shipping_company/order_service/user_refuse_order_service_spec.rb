require 'rails_helper'

describe "User try refuse the order_service" do
    it "with success" do
        # Arrange
        create_new_shipping_company_with_3_carriers
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Ordens de serviço"
        click_on @order_service_code
        click_on "Recusar"

        # Assert
        expect(page).to have_content "A ordem de serviço foi recusada com sucesso."
    end

    it "but not see Refuse button" do
        # Arrange
        create_new_shipping_company_with_3_carriers
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Ordens de serviço"
        click_on @order_service_code

        # Assert
        expect(page).not_to have_button "Recusar"
    end
end
