require 'rails_helper'

RSpec.describe Price, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when cubic_start (Metros cúbicos mínimo) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: "", cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price).not_to be_valid
            end

            it "False when cubic_end (Metros cúbicos máximo) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: "", weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price).not_to be_valid
            end

            it "False when weight_start (Peso mínimo) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: 0.500, weight_start: "", weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price).not_to be_valid
            end
            it "False when weight_end (Peso náximo) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: "", value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price).not_to be_valid
            end
            it "False when value_kilometer (Valor por kilometro) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(price).not_to be_valid
            end
            it "False when shipping_company_id (transportadora) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: "")

                # Act
                # Assert
                expect(price).not_to be_valid
            end
        end

        context "false when field is invalid characters" do
            it "false when cubic_start greater than cubic_end" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.8, cubic_end: 0.5, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price.valid?).to eq false
            end

            it "false when weight_start greater than weight_end" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price = Price.new(cubic_start: 0.001, cubic_end: 0.500, weight_start: 10000, weight_end: 2000, value_kilometer_cents: 50, shipping_company_id: 1)

                # Act
                # Assert
                expect(price.valid?).to eq false
            end
        end
    end
end
