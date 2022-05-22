require 'rails_helper'

RSpec.describe DeliveryTime, type: :model do
  describe "#valid?" do
        context "presence" do
            it "False when range_start (Kilometragem inicial) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: "", range_end: 100, working_day: 4, shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time).not_to be_valid
            end

            it "False when range_end (Kilometragem final) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: 0, range_end: "", working_day: 4, shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time).not_to be_valid
            end

            it "False when working_day (dias úteis) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: 0, range_end: 100, working_day: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time).not_to be_valid
            end

            it "False when shipping_company_id (Transportadora) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: "")

                # Act
                # Assert
                expect(delivery_time).not_to be_valid
            end
        end

        context "false when field is invalid characters" do
            it "false when range_start is not a number" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: "abc", range_end: 100, working_day: 4, shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time.valid?).to eq false
            end

            it "false when range_end is not a number" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: 0, range_end: "abc", working_day: 4, shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time.valid?).to eq false
            end

            it "false when working_day is not a number" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                delivery_time = DeliveryTime.new(range_start: 0, range_end: 100, working_day: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(delivery_time.valid?).to eq false
            end
        end
    end
end
