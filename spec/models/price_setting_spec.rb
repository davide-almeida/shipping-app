require 'rails_helper'

RSpec.describe PriceSetting, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when value_min_cents (Valor mínimo de cobrança (R$) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price_setting = PriceSetting.new(value_min_cents: "", shipping_company_id: 1)

                # Act
                # Assert
                expect(price_setting).not_to be_valid
            end

            it "False when shipping_company_id (Transportadora) is empty" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price_setting = PriceSetting.new(value_min_cents: 5000, shipping_company_id: "")

                # Act
                # Assert
                expect(price_setting).not_to be_valid
            end
        end

        context "false when field is invalid characters" do
            it "false when value_min_cents is not a number" do
                # Arrange
                ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@acme.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")
                price_setting = PriceSetting.new(value_min_cents: "abc", shipping_company_id: 1)

                # Act
                # Assert
                expect(price_setting.valid?).to eq false
            end
        end
    end
end
