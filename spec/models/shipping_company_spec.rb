require 'rails_helper'

RSpec.describe ShippingCompany, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when brand_name (Nome fantasia) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end

            it "False when corporate_name (Razão social) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end

            it "False when domain (Domínio) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end
            it "False when registration_number (CNPJ) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end
            it "False when full_address (Endereço) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end
            it "False when status (Status) is empty" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "")

                # Act
                # Assert
                expect(shipping_company).not_to be_valid
            end
        end

        context "false when field is already in use" do
            it "false when registration_number (CNPJ) is already in use" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                second_shipping_company = ShippingCompany.new(brand_name: "Outra empresa teste", corporate_name: "Outro Testee", domain: "outroemail@teste.com", registration_number: "00.000.000/0000-00", full_address: "Outro Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(second_shipping_company.valid?).to eq false
            end
        end

        context "false when field is invalid characters" do
            it "false when registration_number (CNPJ) more than 18 characters" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00123", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company.valid?).to eq false
            end

            it "false when registration_number (CNPJ) less than 18 characters" do
                # Arrange
                shipping_company = ShippingCompany.new(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "123456", full_address: "Endereço teste", status: "Ativo")

                # Act
                # Assert
                expect(shipping_company.valid?).to eq false
            end
        end
    end
end

