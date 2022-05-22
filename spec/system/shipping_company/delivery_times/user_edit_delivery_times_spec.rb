require 'rails_helper'

describe "User edit a delivery time" do
    it "with success" do
        # Arrange
        create_new_shipping_company
        create_new_user
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "0.0km a 100.0km"
        fill_in "Kilometragem inicial",	with: "1.5"
        fill_in "Kilometragem final", with: "150.12"
        fill_in "Dias úteis", with: "8"
        click_on "Cadastrar"

        # Assert
        expect(current_path).to eq shipping_company_delivery_times_path
        expect(page).to have_content "Prazo de entrega atualizado com sucesso."
    end

    it "with empty params" do
        # Arrange
        create_new_shipping_company
        create_new_user
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "0.0km a 100.0km"
        fill_in "Kilometragem inicial",	with: ""
        fill_in "Kilometragem final", with: ""
        fill_in "Dias úteis", with: "8"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar o prazo de entrega."
        expect(page).to have_content "Kilometragem inicial não pode ficar em branco"
        expect(page).to have_content "Kilometragem final não pode ficar em branco"
    end

    it "with wrong params" do
        # Arrange
        create_new_shipping_company
        create_new_user
        DeliveryTime.create!(range_start: 0, range_end: 100, working_day: 4, shipping_company_id: 1)

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Prazos"
        click_on "0.0km a 100.0km"
        fill_in "Kilometragem inicial",	with: "abc"
        fill_in "Kilometragem final", with: "def"
        fill_in "Dias úteis", with: "8"
        click_on "Cadastrar"

        # Assert
        expect(page).to have_content "Não foi possível atualizar o prazo de entrega."
        expect(page).to have_content "Kilometragem inicial não é um número"
        expect(page).to have_content "Kilometragem final não é um número"
    end
    
end
