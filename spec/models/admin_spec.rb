require 'rails_helper'

RSpec.describe Admin, type: :model do
    describe "#valid?" do
        context "presence" do
            it "False when Firstname is empty" do
                # Arrange
                admin = Admin.new(firstname: "", lastname: "Almeida", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(admin).not_to be_valid
            end

            it "False when Lastname is empty" do
                # Arrange
                admin = Admin.new(firstname: "Davide", lastname: "", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(admin).not_to be_valid
            end

            it "Success" do
                # Arrange
                admin = Admin.new(firstname: "Davide", lastname: "Almeida", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(admin).to be_valid
            end
        end

        context "wrong email domain" do
            it "False when sistemadefrete.com.br not included on E-MAIL" do
                # Arrange
                admin = Admin.new(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")

                # Act
                # Assert
                expect(admin).not_to be_valid
            end
        end
    end
end
