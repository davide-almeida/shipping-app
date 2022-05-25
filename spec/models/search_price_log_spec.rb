require 'rails_helper'

RSpec.describe SearchPriceLog, type: :model do
  describe "#valid?" do
        context "presence" do
            it "False when brand_name is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when corporate_name is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when domain is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when registration_number is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when cubic_meter is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: "", value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when value_kilometer_cents is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: "", value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when value_min_cents is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: "", deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when deadline is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: "", range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when range is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: "", total_value_cents: 80000, search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when total_value_cents is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: "", search_date: (Time.now + 1.month))

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
            it "False when search_date is empty" do
                # Arrange
                search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: "")

                # Act
                # Assert
                expect(search_price_log).not_to be_valid
            end
        end

        context "false when field is invalid characters" do
          it "false when registration_number more than 18 characters" do
              # Arrange
              search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-001", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

              # Act
              # Assert
              expect(search_price_log.valid?).to eq false
          end

          it "false when registration_number (CNPJ) less than 18 characters" do
              # Arrange
              search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-0", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

              # Act
              # Assert
              expect(search_price_log.valid?).to eq false
          end
        end

        it "Success" do
          # Arrange
          search_price_log = SearchPriceLog.new(brand_name: "BrandName teste", corporate_name: "CorporateName teste", domain: "teste.com", registration_number: "00.000.000/0000-00", cubic_meter: 0.5, value_kilometer_cents: 100, value_min_cents: 30000, deadline: 6, range: 100, total_value_cents: 80000, search_date: (Time.now + 1.month))

          # Act
          # Assert
          expect(search_price_log).to be_valid
      end
        
    end
end
