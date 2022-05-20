require 'rails_helper'

describe "User register a new account" do
    it "with success" do
        # Arrange
        create_new_shipping_company

        # Act
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Criar conta"
        fill_in "Nome",	with: "User"
        fill_in "Sobrenome", with: "Test"
        fill_in "E-mail", with: "usertest@acme.com"
        fill_in "Senha", with: "123123"
        fill_in "Confirmar senha", with: "123123"
        click_on "Cadastrar"

        # Assert
        expect(current_path).to eq shipping_company_root_path
        expect(page).to have_content "Boas vindas! Você realizou seu registro com sucesso."
        expect(page).to have_content "usertest@acme.com"
    end

    it "with wrong email" do
        # Arrange
        create_new_shipping_company

        # Act
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Criar conta"
        fill_in "Nome",	with: "User"
        fill_in "Sobrenome", with: "Test"
        fill_in "E-mail", with: "usertest@asdasd.com"
        fill_in "Senha", with: "123123"
        fill_in "Confirmar senha", with: "123123"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "E-mail deve ter o domínio igual ao domínio de uma transportadora previamente cadastrada. Transportadora inexistente."
        expect(page).to have_content "Transportadora inexistente."
    end

    it "with empty fields" do
        # Arrange
        create_new_shipping_company

        # Act
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Criar conta"
        fill_in "Nome",	with: ""
        fill_in "Sobrenome", with: ""
        fill_in "E-mail", with: "usertest@asdasd.com"
        fill_in "Senha", with: "123123"
        fill_in "Confirmar senha", with: ""
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "E-mail deve ter o domínio igual ao domínio de uma transportadora previamente cadastrada. Transportadora inexistente."
        expect(page).to have_content "Transportadora inexistente."
        expect(page).to have_content "Confirmar senha não é igual a Senha"
        expect(page).to have_content "Nome não pode ficar em branco"
        expect(page).to have_content "Sobrenome não pode ficar em branco"
    end
    
end
