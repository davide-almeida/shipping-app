require 'rails_helper'

describe "User edit a price" do
    it "with success" do
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
        click_on "Editar"
        fill_in "Metros cúbicos mínimo", with: 0.4
        fill_in "Metros cúbicos máximo", with: 0.8
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Preço atualizado com sucesso"
        expect(page).to have_content "Metros cúbicos: 0.4 a 0.8"
    end

    it "with empty fields" do
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
        click_on "Editar"
        fill_in "Metros cúbicos mínimo", with: ""
        fill_in "Metros cúbicos máximo", with: ""
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar o preço."
        expect(page).to have_content "Metros cúbicos mínimo não pode ficar em branco"
        expect(page).to have_content "Metros cúbicos máximo não pode ficar em branco"
    end

    it "with cubic_end is less them cubic_start" do
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
        click_on "Editar"
        fill_in "Metros cúbicos mínimo", with: 0.4
        fill_in "Metros cúbicos máximo", with: 0.3
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar o preço."
        expect(page).to have_content "Metros cúbicos máximo deve ser maior ou igual a 0.4"
        expect(page).to have_content "Metros cúbicos mínimo deve ser menor ou igual a 0.3"
    end

    it "with weight_end is less them weight_start" do
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
        click_on "Editar"
        fill_in "Metros cúbicos mínimo", with: 0.4
        fill_in "Metros cúbicos máximo", with: 0.8
        fill_in "Peso mínimo (gramas)", with: 10000
        fill_in "Peso máximo (gramas)", with: 0
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar o preço."
        expect(page).to have_content "Peso máximo (gramas) deve ser maior ou igual a 10000"
        expect(page).to have_content "Peso mínimo (gramas) deve ser menor ou igual a 0"
    end
end
