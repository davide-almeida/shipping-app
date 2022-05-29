require 'rails_helper'

describe "Admin visit order_service details page" do
    it "and see all informations" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        @order_service_code = SecureRandom.alphanumeric(15)
        OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
        Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_service_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Ordens de Serviço"
        click_on @order_service_code

        # Assert
        expect(page).to have_content "Código: #{@order_service_code}"
        expect(page).to have_content "Status: Pendente"
        expect(page).to have_content "Transportadora: ACME"
        expect(page).to have_content "Endereço de retirada: Endereço teste de retirada, 1000"
        expect(page).to have_content "Distância a ser percorrida: 1.0 km"
        expect(page).to have_content "Largura: 1.0"
        expect(page).to have_content "Altura: 1.0"
        expect(page).to have_content "Profundidade: 1.0"
        expect(page).to have_content "Peso: 1.0kg"
        expect(page).to have_content "Valor total: R$20,00"
        expect(page).to have_content "Destinatário: Davide Almeida"
        expect(page).to have_content "RG: 123123123"
        expect(page).to have_content "Endereço de entrega: Endereço do destinatário"
    end
    
end
