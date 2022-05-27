require 'rails_helper'

RSpec.describe Receiver, type: :model do
    context "presence" do
        it "False when full_address is empty" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_id: 1)

            # Act
            # Assert
            expect(receiver).not_to be_valid
        end

        it "False when first_name is empty" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"", last_name: "Almeida", registration_code: "123123123", order_id: 1)

            # Act
            # Assert
            expect(receiver).not_to be_valid
        end

        it "False when last_name is empty" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "", registration_code: "123123123", order_id: 1)

            # Act
            # Assert
            expect(receiver).not_to be_valid
        end

        it "False when registration_code is empty" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "", order_id: 1)

            # Act
            # Assert
            expect(receiver).not_to be_valid
        end

        it "False when order_id is empty" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_id: "")

            # Act
            # Assert
            expect(receiver).not_to be_valid
        end

    end

    context "false when field is invalid characters" do
        it "false when registration_code greater than 9 characters" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "1234567890", order_id: 1)

            # Act
            # Assert
            expect(receiver.valid?).to eq false
        end

        it "false when registration_code less than 9 characters" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "12345678", order_id: 1)

            # Act
            # Assert
            expect(receiver.valid?).to eq false
        end

        it "false when registration_code is not unique" do
            # Arrange
            ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
            @order_code = SecureRandom.alphanumeric(15)
            Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
            Receiver.create!(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123456789", order_id: 1)
            receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123456789", order_id: 1)

            # Act
            # Assert
            expect(receiver.valid?).to eq false
        end
    end
    it "Success" do
      # Arrange
      ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
      @order_code = SecureRandom.alphanumeric(15)
      Order.create!(status:"Pendente", code: @order_code, full_address:"Endereço teste de retirada, 1000", width: 1.0, height: 1.0, depth: 1.0, weight: 1.0, range: 1.0, total_value_cents: 2000, shipping_company_id: 1)
      receiver = Receiver.new(full_address: "Endereço do destinatário", first_name:"Davide", last_name: "Almeida", registration_code: "123123123", order_id: 1)

      # Act
      # Assert
      expect(receiver).to be_valid
    end
end
