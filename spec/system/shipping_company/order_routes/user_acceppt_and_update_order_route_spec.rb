require 'rails_helper'

describe "User acceppt the new order_route" do
    it "with success" do
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
        fill_in "Localização (endereço)", with: "Cidade exemplo 2"
        select "A caminho", from: "Status"
        click_on "Cadastrar"

        #Assert
        expect(page).to have_content "Rota atualizada com sucesso."
        expect(page).to have_content "Cidade exemplo 2"
    end

    it "with success and update the route with 'Concluída' " do
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

        #Assert
        expect(page).to have_content "Rota atualizada com sucesso."
        expect(page).to have_content "Endereço do destinatário"
        expect(page).to have_content "Concluída"
    end

    it "with success, change status to 'Concluída' and try update route again" do
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
        visit new_shipping_company_order_service_order_route_path(OrderService.last.id)

        #Assert
        expect(page).to have_content "Esta rota já foi concluída."
    end

    it "with success, change status to 'Concluída' and can't see 'Atualizar Rota' button" do
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

        #Assert
        expect(page).not_to have_content "Atualizar Rota"
    end
end
