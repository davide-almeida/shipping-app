require 'rails_helper'

describe "User edit the price_setting" do
    it "with success" do
       # Arrange
       create_new_shipping_company
       create_new_user
       PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)

       # Act
       login_as(@new_user, :scope => :user)
       visit root_path
       click_on "Acesso Transportadora"
       click_on "Preços"
       click_on "Configuração de Preço"
       fill_in "Valor mínimo de cobrança (R$)",	with: "157,35"
       click_on "Cadastrar"

       # Assert
       expect(page).to have_content "Configuração de preço atualizada com sucesso."
       expect(page).to have_field "Valor mínimo de cobrança (R$)", with: "157,35"
    end
    
    it "with wrong parameter" do
       # Arrange
       create_new_shipping_company
       create_new_user
       PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)

       # Act
       login_as(@new_user, :scope => :user)
       visit root_path
       click_on "Acesso Transportadora"
       click_on "Preços"
       click_on "Configuração de Preço"
       fill_in "Valor mínimo de cobrança (R$)",	with: "abc"
       click_on "Cadastrar"

       # Assert
       expect(page).to have_content "Não foi possível atualizar a configuração de preço."
       expect(page).to have_content "Valor mínimo de cobrança (R$) não é um número"
    end   

    it "with empty parameter" do
       # Arrange
       create_new_shipping_company
       create_new_user
       PriceSetting.create!(value_min_cents: 5000, shipping_company_id: 1)

       # Act
       login_as(@new_user, :scope => :user)
       visit root_path
       click_on "Acesso Transportadora"
       click_on "Preços"
       click_on "Configuração de Preço"
       fill_in "Valor mínimo de cobrança (R$)",	with: ""
       click_on "Cadastrar"

       # Assert
       expect(page).to have_content "Não foi possível atualizar a configuração de preço."
       expect(page).to have_content "Valor mínimo de cobrança (R$) não é um número"
    end   
end
