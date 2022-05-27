require 'rails_helper'

describe "Admin visit orders page (index)" do
    it "and see orders recorded" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")

        @order_code_first = SecureRandom.alphanumeric(15)
        Order.create!(status:"Pendente", code: @order_code_first, full_address:"Primeiro Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
        Receiver.create!(full_address: "Primeiro Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_id: 1)
        
        @order_code_second = SecureRandom.alphanumeric(15)            
        Order.create!(status:"Pendente", code: @order_code_second, full_address:"Segundo Endereço teste de retirada, 1000", width: 2.0, height: 2.0, depth: 2.0, weight: 2.0, range: 2.0, total_value_cents: 4000, shipping_company_id: 1)
        Receiver.create!(full_address: "Segundo Endereço do destinatário", first_name:"Simba", last_name: "O meu cachorro", registration_code: "321321321", order_id: 1)

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Ordens de Serviço"

        # Assert
        expect(page).to have_content "#{@order_code_first}"
        expect(page).to have_content "#{@order_code_second}"
    end

    it "without any register" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Ordens de Serviço"

        # Assert
        expect(page).to have_content "Não existem ordens de serviço cadastradas"
    end
end