require 'rails_helper'

RSpec.describe OrderRoute, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when current_location is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_service_code = SecureRandom.alphanumeric(15)
                OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
                order_route = OrderRoute.new(current_location: "", current_time: Time.now, status: "A caminho", order_service_id: 1)

                # Act
                # Assert
                expect(order_route).not_to be_valid
            end

            it "False when current_time is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_service_code = SecureRandom.alphanumeric(15)
                OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
                order_route = OrderRoute.new(current_location: "Endereço de retirada", current_time: "", status: "A caminho", order_service_id: 1)

                # Act
                # Assert
                expect(order_route).not_to be_valid
            end

            it "False when status is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_service_code = SecureRandom.alphanumeric(15)
                OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
                order_route = OrderRoute.new(current_location: "Endereço de retirada", current_time: Time.now, status: "", order_service_id: 1)

                # Act
                # Assert
                expect(order_route).not_to be_valid
            end
            
            it "False when order_service_id is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_service_code = SecureRandom.alphanumeric(15)
                OrderService.create!(status:"Aceita", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
                order_route = OrderRoute.new(current_location: "Endereço de retirada", current_time: Time.now, status: "A caminho", order_service_id: "")

                # Act
                # Assert
                expect(order_route).not_to be_valid
            end
        end

        it "Success" do
          # Arrange
          ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
          @order_service_code = SecureRandom.alphanumeric(15)
          OrderService.create!(status:"Pendente", code: @order_service_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
          order_route = OrderRoute.new(current_location: "Endereço de retirada", current_time: Time.now, status: "A caminho", order_service_id: 1)

          # Act
          # Assert
          expect(order_route).to be_valid
        end
    end
end
