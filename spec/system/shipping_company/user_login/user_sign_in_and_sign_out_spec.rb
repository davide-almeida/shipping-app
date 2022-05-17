require 'rails_helper'

describe "User visits the login page" do
    it "and see login form" do
        # Arrange
        # Act
        visit root_path
        click_on "Acesso Transportadora"
        # Assert
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content "Transportadora - Login"
        expect(page).to have_button "Entrar"
    end

    it "and sign in" do
        # Arrange
        User.create!(firstname: "User", lastname: "Transportadora", email: "transportadora@acme.com", password: "123123", password_confirmation: "123123")

        # Act
        visit root_path
        click_on "Acesso Transportadora"

        fill_in "E-mail", with:"transportadora@acme.com"
        fill_in "Senha", with:"123123"
        click_on "Entrar"

        # Assert
        expect(current_path).to eq shipping_company_root_path
        expect(page).not_to have_button "Entrar"
        expect(page).to have_content "Login efetuado com sucesso."
        expect(page).to have_content "transportadora@acme.com"
        expect(page).to have_button "Sair"
    end
end
