require 'rails_helper'

describe "Admin register a new User (colaborador)" do
    it "with success" do
        # Arrange
        create_new_admin
        create_new_shipping_company
        
        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Colaboradores"
        click_on "Cadastrar Colaborador"
        fill_in "Nome",	with: "Davide"
        fill_in "Sobrenome", with: "Almeida"
        fill_in "E-mail", with: "davide@acme.com"
        fill_in "Senha", with: "123123"
        fill_in "Confirmar senha", with: "123123"
        click_on "Cadastrar"


        # Assert
        # expect(current_path).to eq new_app_user_path
        expect(page).to have_content "O cadastro davide@acme.com foi realizado com sucesso!"
    end

    it "when email domain not exist" do
        # Arrange
        create_new_admin
        
        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Colaboradores"
        click_on "Cadastrar Colaborador"
        fill_in "Nome",	with: "Davide"
        fill_in "Sobrenome", with: "Almeida"
        fill_in "E-mail", with: "davide@wrong.com"
        fill_in "Senha", with: "123123"
        fill_in "Confirmar senha", with: "123123"
        click_on "Cadastrar"


        # Assert
        # expect(current_path).to eq new_app_user_path
        expect(page).to have_content "Cadastrar Colaborador(a)"
        expect(page).to have_content "Não foi possível cadastrar o usuário"
        expect(page).to have_content "E-mail deve ter o domínio igual ao domínio de uma transportadora previamente cadastrada."
        expect(page).to have_content "Transportadora inexistente."
    end
    
end
