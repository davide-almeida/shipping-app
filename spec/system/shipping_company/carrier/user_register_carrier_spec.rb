require 'rails_helper'

describe "User register a new carrier" do
    it "with success" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Veículos"
        click_on "Cadastrar Veículo"
        fill_in "Placa de identificação", with: "JKL-7898"
        fill_in "Marca", with: "Ford"
        fill_in "Ano de fabricação", with: "2021"
        fill_in "Modelo", with: "QWER-789"
        fill_in "Peso (gramas)", with: "4500"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Veículo cadastrado com sucesso."
        expect(page).to have_content "Veículo - JKL-7898"
        expect(page).to have_content "Placa: JKL-7898"
        expect(page).to have_content "Capacidade peso: 4.5kg"
    end

    it "with empty params" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Veículos"
        click_on "Cadastrar Veículo"
        fill_in "Placa de identificação", with: ""
        fill_in "Marca", with: ""
        fill_in "Ano de fabricação", with: "2021"
        fill_in "Peso (gramas)", with: "4500"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível cadastrar o veículo."
        expect(page).to have_content "Placa de identificação não pode ficar em branco"
        expect(page).to have_content "Marca não pode ficar em branco"
        expect(page).to have_content "Modelo não pode ficar em branco"
    end

    context "with wrong params" do
        it "with license_plate less them 5 characters" do
            # Arrange
            create_new_shipping_company
            create_new_user
    
            # Act
            login_as(@new_user, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            click_on "Veículos"
            click_on "Cadastrar Veículo"
            fill_in "Placa de identificação", with: "1234"
            fill_in "Marca", with: "Ford"
            fill_in "Ano de fabricação", with: "2021"
            fill_in "Modelo", with: "QWER-789"
            fill_in "Peso (gramas)", with: "4500"
            click_on "Cadastrar"
    
            # Assert
            expect(page).to have_content "Não foi possível cadastrar o veículo."
            expect(page).to have_content "Placa de identificação deve possuir no mínimo 5 caracteres."
        end

        it "with code_model less them 6 characters" do
            # Arrange
            create_new_shipping_company
            create_new_user
    
            # Act
            login_as(@new_user, :scope => :user)
            visit root_path
            click_on "Acesso Transportadora"
            click_on "Veículos"
            click_on "Cadastrar Veículo"
            fill_in "Placa de identificação", with: "JKL-7898"
            fill_in "Marca", with: "Ford"
            fill_in "Ano de fabricação", with: "2021"
            fill_in "Modelo", with: "12345"
            fill_in "Peso (gramas)", with: "4500"
            click_on "Cadastrar"
    
            # Assert
            expect(page).to have_content "Não foi possível cadastrar o veículo."
            expect(page).to have_content "Modelo deve possuir no mínimo 6 caracteres."
        end
    end
    
end
