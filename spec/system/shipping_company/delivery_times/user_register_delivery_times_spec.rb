require 'rails_helper'

describe "User register a new delivery time" do
    it "with success" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "Cadastrar Prazo"
        fill_in "Kilometragem inicial",	with: "0"
        fill_in "Kilometragem final", with: "100"
        fill_in "Dias úteis", with: "4"
        click_on "Cadastrar"

        # Assert
        expect(current_path).to eq shipping_company_delivery_times_path
        expect(page).to have_content "Prazo de entrega cadastrado com sucesso."
    end

    it "with empty params" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "Cadastrar Prazo"
        fill_in "Kilometragem inicial",	with: ""
        fill_in "Kilometragem final", with: ""
        fill_in "Dias úteis", with: "4"
        click_on "Cadastrar"

        # Assert
        expect(current_path).to eq shipping_company_delivery_times_path
        expect(page).to have_content "Não foi possível cadastrar o prazo de entrega."
        expect(page).to have_content "Kilometragem inicial não pode ficar em branco"
        expect(page).to have_content "Kilometragem final não pode ficar em branco"
    end

    it "with wrong params" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "Cadastrar Prazo"
        fill_in "Kilometragem inicial",	with: "abc"
        fill_in "Kilometragem final", with: "def"
        fill_in "Dias úteis", with: "4"
        click_on "Cadastrar"

        # Assert
        expect(current_path).to eq shipping_company_delivery_times_path
        expect(page).to have_content "Não foi possível cadastrar o prazo de entrega."
        expect(page).to have_content "Kilometragem inicial não é um número"
        expect(page).to have_content "Kilometragem final não é um número"
    end
    
end
