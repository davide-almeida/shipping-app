require 'rails_helper'

describe "User accept order service" do
    it "with sucess" do
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
        click_on "Aceitar"
        select "MER-1111", from: "Veículo"
        click_on "Vincular veículo e Aceitar"

        # Assert
        expect(page).to have_content "Ordem de serviço aceita, veículo vinculado e uma nova rota foi criada com sucesso."
        expect(page).to have_content @order_service_code
        expect(page).to have_content "Endereço teste de retirada, 1000"
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "R$20,00"
        expect(page).to have_content "MER-1111"
        expect(page).to have_content "Aceita"
    end

    it "without carriers" do
        # Arrange
        create_new_shipping_company
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
        click_on "Aceitar"

        # Assert
        expect(page).to have_content "Não há veículos cadastrados que suportem o peso do produto a ser transportado."
    end

    it "but the car cannot carry the load" do
        # Arrange
        create_new_shipping_company
        create_new_carriers_with_1g
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
        click_on "Aceitar"

        # Assert
        expect(page).to have_content "Não há veículos cadastrados que suportem o peso do produto a ser transportado."
    end
    
end
