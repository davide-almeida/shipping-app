require 'rails_helper'

describe "User visit DeliveryTime pages" do
    it "and see delivery_time recorded" do
        # Arrange
        create_new_shipping_company
        create_new_user
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"

        # Assert
        expect(page).to have_content "Prazos de entrega"
        expect(page).to have_content "Lista prazos de entrega"
        expect(page).to have_link "Cadastrar Prazo"
        expect(page).to have_content "0.0km a 100.0km"
        expect(page).to have_content "4 dias úteis"
    end

    it "and see delivery_time without recorded datas" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"

        # Assert
        expect(page).to have_content "Prazos de entrega"
        expect(page).to have_content "Lista prazos de entrega"
        expect(page).to have_content "Não existem prazos de entrega cadastrados"
    end
    
end
