require 'rails_helper'

describe "User register a new price" do
    it "with success" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "Cadastrar Preço"
        fill_in "Metros cúbicos mínimo", with: 0.4
        fill_in "Metros cúbicos máximo", with: 0.8
        fill_in "Peso mínimo (gramas)", with: "0"
        fill_in "Peso máximo (gramas)", with: "10000"
        fill_in "Valor por km", with: "1,38"
        click_on "Cadastrar"
        save_page

        # Assert
        expect(page).to have_content "Preço cadastrado com sucesso"
        expect(page).to have_content "Valor por km: R$1,38 por km"
        expect(page).to have_content "Peso: 0kg a 10kg"
        expect(page).to have_content "Metros cúbicos: 0.4 a 0.8"
    end

    it "with empty fields" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "Cadastrar Preço"
        fill_in "Metros cúbicos mínimo", with: ""
        fill_in "Metros cúbicos máximo", with: ""
        fill_in "Peso mínimo (gramas)", with: "0"
        fill_in "Peso máximo (gramas)", with: "10000"
        fill_in "Valor por km", with: "1,38"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível cadastrar o preço."
        expect(page).to have_content "Metros cúbicos mínimo não pode ficar em branco"
        expect(page).to have_content "Metros cúbicos máximo não pode ficar em branco"
    end

    it "with cubic_end is less them cubic_start" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "Cadastrar Preço"
        fill_in "Metros cúbicos mínimo", with: 0.4
        fill_in "Metros cúbicos máximo", with: 0.3
        fill_in "Peso mínimo (gramas)", with: "0"
        fill_in "Peso máximo (gramas)", with: "10000"
        fill_in "Valor por km", with: "1,38"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível cadastrar o preço."
        expect(page).to have_content "Metros cúbicos máximo deve ser maior ou igual a 0.4"
        expect(page).to have_content "Metros cúbicos mínimo deve ser menor ou igual a 0.3"
    end

    it "with weight_end is less them weight_start" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"
        click_on "Cadastrar Preço"
        fill_in "Metros cúbicos mínimo", with: 0.3
        fill_in "Metros cúbicos máximo", with: 0.8
        fill_in "Peso mínimo (gramas)", with: "5000"
        fill_in "Peso máximo (gramas)", with: "2000"
        fill_in "Valor por km", with: "1,38"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível cadastrar o preço."
        expect(page).to have_content "Peso máximo (gramas) deve ser maior ou igual a 5000"
        expect(page).to have_content "Peso mínimo (gramas) deve ser menor ou igual a 2000"
    end
    
end
