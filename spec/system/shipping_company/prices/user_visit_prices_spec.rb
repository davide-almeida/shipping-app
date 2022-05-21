require 'rails_helper'

describe "User visit Prices page" do
    it "and see prices list" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"

        # Assert
        expect(page).to have_content "Lista preços"
        expect(page).to have_link "Cadastrar Preço"
    end

    it "and visit details page (show)" do
        # Arrange
        create_new_shipping_company
        create_new_user
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "0.001 a 0.5"

        # Assert
        expect(page).to have_content "Preço"
        expect(page).to have_content "R$0,50 por km"
        expect(page).to have_content "Metros cúbicos: 0.001 a 0.5"
        expect(page).to have_content "Peso: 0kg a 10kg"
        expect(page).to have_content "Valor por km: R$0,50 por km"
        expect(page).to have_link "Editar"
        expect(page).to have_link "Voltar"
    end

    it "visit details page (show) and go back to Prices list" do
        # Arrange
        create_new_shipping_company
        create_new_user
        Price.create!(cubic_start: 0.001, cubic_end: 0.500, weight_start: 0, weight_end: 10000, value_kilometer_cents: 50, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "0.001 a 0.5"
        click_on "Voltar"

        # Assert
        expect(page).to have_content "Lista preços"
        expect(page).to have_link "Cadastrar Preço"
    end
    
end
