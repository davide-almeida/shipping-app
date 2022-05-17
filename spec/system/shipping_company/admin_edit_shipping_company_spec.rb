require 'rails_helper'

describe "Admin update a shipping company" do
    it "with success" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Inativo")

        # Act
        login_as(@new_admin)
        visit app_root_path
        click_on "Transportadoras"
        click_on "ACME"
        click_on "Editar"

        fill_in "Razão social", with: "ACMEEE"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Transportadora atualizada com sucesso."
        expect(page).to have_content "ACMEEE"
        expect(page).to have_content "Inativo"
    end

    it "without some parameters" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")

        # Act
        login_as(@new_admin)
        visit app_root_path
        click_on "Transportadoras"
        click_on "ACME"
        click_on "Editar"

        fill_in "Nome fantasia", with: "Nome fantasia teste"
        fill_in "Razão social", with: ""
        fill_in "Domínio", with: ""
        fill_in "CNPJ", with: "xx.xxx.xxx/xxxx-xx"
        fill_in "Endereço", with: ""
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar a transportadora."
        expect(page).to have_content "Razão social não pode ficar em branco"
        expect(page).to have_content "Domínio não pode ficar em branco"
        expect(page).to have_content "Endereço não pode ficar em branco"
        expect(page).to have_button "Cadastrar"
    end

    it "typing more than 18 characters in the CNPJ field" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")

        # Act
        login_as(@new_admin)
        visit app_root_path
        click_on "Transportadoras"
        click_on "ACME"
        click_on "Editar"

        fill_in "CNPJ", with: "xx.xxx.xxx/xxxx-xx467468576465"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar a transportadora."
        expect(page).to have_content "CNPJ deve possuir 18 caracteres."
        expect(page).to have_button "Cadastrar"
    end

    it "typing less than 18 characters in the CNPJ field" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")

        # Act
        login_as(@new_admin)
        visit app_root_path
        click_on "Transportadoras"
        click_on "ACME"
        click_on "Editar"

        fill_in "CNPJ", with: "123456"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar a transportadora."
        expect(page).to have_content "CNPJ deve possuir 18 caracteres."
        expect(page).to have_button "Cadastrar"
    end

    it "when CNPJ already exists" do
        # Arrange
        create_new_admin
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "ACME", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx-xx", full_address: "123123", status: "Ativo")
        ShippingCompany.create!(brand_name: "ACME LTDA", corporate_name: "TESTE", domain: "acme@acme.com", registration_number: "xx.xxx.xxx/xxxx123", full_address: "123123", status: "Ativo")

        # Act
        login_as(@new_admin)
        visit app_root_path
        click_on "Transportadoras"
        click_on "ACME"
        click_on "Editar"

        fill_in "CNPJ", with: "xx.xxx.xxx/xxxx123"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar a transportadora."
        expect(page).to have_content "CNPJ já está em uso"
        expect(page).to have_button "Cadastrar"
    end
end
