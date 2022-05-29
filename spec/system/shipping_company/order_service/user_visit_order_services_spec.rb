require 'rails_helper'

describe "User visit order_services page" do
    it "and see all order_services" do
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

        # Assert
        expect(page).to have_content "Ordens de serviço"
        expect(page).to have_content "#{@order_service_code}"
        expect(page).to have_content "Pendente"
        expect(page).to have_content "Endereço teste de retirada, 1000"
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "R$20,00"
    end

    it "and there isn't order_service recorded" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Ordens de serviço"

        # Assert
        expect(page).to have_content "Não existem ordens de serviço cadastradas."
    end

    it "and see order_service details" do
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

        # Assert
        expect(page).to have_content "Ordem de serviço"
        expect(page).to have_content "#{@order_service_code}"
        expect(page).to have_content "Pendente"
        expect(page).to have_content "Endereço teste de retirada, 1000"
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "R$20,00"
    end

    it "and if order_service status is equal 'Concluida', can't see acceppt button in show page" do
        #Arrange
        create_new_shipping_company
        create_new_carrier
        create_new_user
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)
                    
        #Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Ordens de serviço"
        click_on @order_service_code
        click_on "Aceitar"
        select "MER-1111", from: "Veículo"
        click_on "Vincular veículo e Aceitar"
        click_on "Rotas"
        click_on @order_service_code
        click_on "Atualizar Rota"
        fill_in "Localização (endereço)", with: "Endereço do destinatário"
        select "Concluída", from: "Status"
        click_on "Cadastrar"
        click_on "Ordens de serviço"
        click_on @order_service_code

        #Assert
        expect(page).to have_content @order_service_code
        expect(page).not_to have_content "Aceitar"
    end
end
