require 'rails_helper'

describe "User tries to access" do
    context "other carriers" do
        it "in show page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit shipping_company_carrier_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end

        it "in edit page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit edit_shipping_company_carrier_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end

    context "other price_setting" do
        it "in edit page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit edit_shipping_company_carrier_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end

    context "other price" do
        it "in show page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit shipping_company_price_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end

        it "in edit page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit edit_shipping_company_price_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end

    context "other delivery_times" do
        it "in edit page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit edit_shipping_company_delivery_time_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end

    context "other order_service" do
        it "in show page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit shipping_company_order_service_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end

        it "in edit (Aceitar) page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit edit_shipping_company_order_service_path(2)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end

    context "other order_route" do
        it "in show page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user2_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit shipping_company_order_route_path(3)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end

        it "in edit (Aceitar) page without success" do
            # Arrange
            create_access_validations_dependencies

            # Act
            login_as(@user2_access_validations, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            visit new_shipping_company_order_service_order_route_path(3)

            # Assert
            expect(page).to have_content "Você tentou acessar uma informação inexistente."
        end
    end
end
