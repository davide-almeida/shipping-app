require 'rails_helper'

describe "Admin visit SearchPriceLogs page" do
    it "and see all logs recorded" do
        # Arrange
        create_new_admin
        create_new_search_dependencies

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        fill_in "Largura", with: "1"
        fill_in "Altura", with: "1"
        fill_in "Profundidade", with: "1"
        fill_in "Peso", with: "1"
        fill_in "Distância a ser percorrida (km)", with: "20"
        click_on "Buscar"
        click_on "Histórico de buscas"

        # Assert
        expect(page).to have_content "Histórico de buscas"
        expect(page).to have_content "ShippingCompany 1"
        expect(page).to have_content "ShippingCompany 2"
        expect(page).to have_content "shippingcompany1.com"
        expect(page).to have_content "shippingcompany2.com"
        expect(page).to have_content "xx.xxx.xxx/ship-01"
        expect(page).to have_content "xx.xxx.xxx/ship-02"
        expect(page).to have_content "R$0,75"
        expect(page).to have_content "R$1,50"
        expect(page).to have_content "R$20,00"
        expect(page).to have_content "R$50,00"
    end

    it "and there isn't registers" do
        # Arrange
        create_new_admin
        create_new_search_dependencies

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path
        click_on "Buscar preços"
        click_on "Histórico de buscas"

        # Assert
        expect(page).to have_content "Não há registros de buscas."
    end
    
end
