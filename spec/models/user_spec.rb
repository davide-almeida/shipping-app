require 'rails_helper'

RSpec.describe User, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when Firstname is empty" do
                # Arrange
                create_new_shipping_company
                user = User.new(firstname: "", lastname: "Test", email: "usertest@acme.com", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(user).not_to be_valid
            end

            it "False when Lastname is empty" do
                # Arrange
                create_new_shipping_company
                user = User.new(firstname: "User", lastname: "", email: "usertest@acme.com", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(user).not_to be_valid
            end

            it "Success" do
                # Arrange
                create_new_shipping_company
                user = User.new(firstname: "User", lastname: "Test", email: "usertest@acme.com", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(user).to be_valid
            end
        end

        context "wrong email domain" do
            it "False when domain of email is not equal to domain of some ShippingCompany" do
                # Arrange
                user = User.new(firstname: "Davide", lastname: "Almeida", email: "usertest@acme.com", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(user).not_to be_valid
            end
        end
    end
end
