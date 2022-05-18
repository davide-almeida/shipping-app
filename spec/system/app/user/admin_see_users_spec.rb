require 'rails_helper'

describe "Admin see users (colaboradores)" do
    it "when to visit users page" do
        # Arrange
        create_new_admin
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Colaboradores"

        # Assert
        expect(current_path).to eq app_users_path
        expect(page).to have_content "Lista colaboradores"
        expect(page).to have_content "transportadora@acme.com"
        expect(page).to have_content "User"
        expect(page).to have_link "Cadastrar Colaborador"
    end

    it "when to visit users details (show)" do
        # Arrange
        create_new_admin
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Colaboradores"
        click_on "User"

        # Assert
        expect(page).to have_content "Colaborador(a) - User"
        expect(page).to have_content "Nome: User"
        expect(page).to have_content "Sobrenome: Transportadora"
        expect(page).to have_content "E-mail: transportadora@acme.com"
        expect(page).to have_link "Editar"
        expect(page).to have_link "Voltar"
    end

    it "when to visit users details (show) and back to users page" do
        # Arrange
        create_new_admin
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Colaboradores"
        click_on "User"
        click_on "Voltar"

        # Assert
        expect(current_path).to eq app_users_path
        expect(page).to have_content "Lista colaboradores"
        expect(page).to have_content "transportadora@acme.com"
        expect(page).to have_content "User"
        expect(page).to have_link "Cadastrar Colaborador"
    end
    
end
