require 'rails_helper'

describe "Admin access shipping_company" do
    context "if authenticated" do
        it "see shipping companies recorded" do
            # Arrange
            create_new_admin
            ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Inativo")

            # Act
            login_as(@new_admin, :scope => :admin)
            visit app_root_path
            click_on "Transportadoras"

            # Assert
            expect(current_path).to eq app_shipping_companies_path
            expect(page).to have_content "Lista transportadoras"
            expect(page).to have_content "Empresa Teste"
            expect(page).to have_content "Testee"
            expect(page).to have_content "empresateste@teste.com"
            expect(page).to have_content "Inativo"
        end

        it "and there isn't shipping companies recorded" do
            # Arrange
            create_new_admin

            # Act
            login_as(@new_admin, :scope => :admin)
            visit app_root_path
            click_on "Transportadoras"

            # Assert
            expect(current_path).to eq app_shipping_companies_path
            expect(page).to have_content "Não existem transportadoras cadastradas"
        end

        it "and access the shipping companies details (show)" do
            # Arrange
            create_new_admin
            shipping_company = ShippingCompany.create!(brand_name: "Empresa Teste", corporate_name: "Testee", domain: "empresateste@teste.com", registration_number: "00.000.000/0000-00", full_address: "Endereço teste", status: "Ativo")

            # Act
            login_as(@new_admin, :scope => :admin)
            visit app_root_path
            click_on "Transportadoras"
            click_on "Testee"

            # Assert
            expect(current_path).to eq app_shipping_company_path(shipping_company)
            expect(page).to have_content "Transportadora - Empresa Teste"
            expect(page).to have_content "Testee"
            expect(page).to have_content "Domínio: empresateste@teste.com"
            expect(page).to have_content "CNPJ: 00.000.000/0000-00"
            expect(page).to have_content "Endereço: Endereço teste"
            expect(page).to have_content "Status: Ativo"
            expect(page).to have_content "Colaboradores cadastrados: 0"
        end
    end

    context "if NOT authenticated" do
        it "is redirected to login page" do
            # Arrange
            # Act
            visit app_shipping_companies_path

            # Assert
            expect(current_path).to eq new_admin_session_path
            expect(page).to have_content "Para continuar, faça login ou registre-se."
        end
    end
end
