require 'rails_helper'

describe "User visit PriceSettings page" do
    it "and see the settings recorded" do
        # Arrange
        create_new_shipping_company
        create_new_user
        PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"

        # Assert
        expect(page).to have_content "Configurações de preços"
        expect(page).to have_content "Valor mínimo de cobrança: R$50,00"
    end

    it "and see the settings without data" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"

        # Assert
        expect(page).to have_content "Configurações de preços"
        expect(page).to have_content "Não há configurações de preços cadastradas."
    end
end
