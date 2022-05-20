require 'rails_helper'

RSpec.describe Carrier, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when license_plate (Placa de identificação) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end

            it "False when brand (Marca) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end

            it "False when code_model (modelo) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end
            it "False when manufact_year (Ano de fabricação) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "", weight: 5000, shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end
            it "False when weight (peso) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end
            it "False when shipping_company_id (transportadora) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "5000", shipping_company_id: "")

                # Act
                # Assert
                expect(carrier).not_to be_valid
            end
        end

        context "false when field is already in use" do
            it "false when license_plate (placa de identificação) is already in use" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-11", manufact_year: "2020", weight: "6000", shipping_company_id: 1)
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "5000", shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier.valid?).to eq false
            end

            it "false when code_model (modelo) is already in use" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                Carrier.create!(license_plate: "XPO-1000", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "6000", shipping_company_id: 1)
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "5000", shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier.valid?).to eq false
            end
        end

        context "false when field is invalid characters" do
            it "false when license_plate (Placa de identificação) less than 5 characters" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "1234", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: "2020", weight: "5000", shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier.valid?).to eq false
            end

            it "false when code_model (modelo) less than 6 characters" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                carrier = Carrier.new(license_plate: "MKE-0945", brand: "Mercedes", code_model: "12345", manufact_year: "2020", weight: "5000", shipping_company_id: 1)

                # Act
                # Assert
                expect(carrier.valid?).to eq false
            end
        end
    end
end
