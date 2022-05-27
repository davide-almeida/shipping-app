require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#valid?" do
        context "presence" do
            it "False when status is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when code is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                order = Order.new(status:"Pendente", code: "", full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when full_address is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when width is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: "", height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when height is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: "", depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end
            
            it "False when depth is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: "", weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when weight is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: "", range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when range is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: "", total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when total_value_cents is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(order).not_to be_valid
            end

            it "False when shipping_company_id is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = SecureRandom.alphanumeric(15)
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: "")

                # Act
                # Assert
                expect(order).not_to be_valid
            end

        end

        context "false when field is invalid characters" do
            it "false when code greater than 15 characters" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                order = Order.new(status:"Pendente", code: 1234567891234567, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order.valid?).to eq false
            end

            it "false when code less than 15 characters" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                order = Order.new(status:"Pendente", code: 12345678912345, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order.valid?).to eq false
            end

            it "false when code is not alphanumeric" do
                # Arrange
                ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
                @order_code = "12as#*$&#*&$#&$"
                order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

                # Act
                # Assert
                expect(order.valid?).to eq false
            end

            it "false when code is not unique" do
              # Arrange
              ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
              @order_code = SecureRandom.alphanumeric(15)
              Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
              order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada teste, 350", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 4000, shipping_company_id: 1)
    
              # Act
              # Assert
              expect(order).not_to be_valid
            end
        end
        it "Success" do
          # Arrange
          ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
          @order_code = SecureRandom.alphanumeric(15)
          order = Order.new(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)

          # Act
          # Assert
          expect(order).to be_valid
        end
    end
end
