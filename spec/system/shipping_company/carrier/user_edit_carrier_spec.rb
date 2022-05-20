require 'rails_helper'

describe "User edit a carrier" do
    it "see edit page" do
      # Arrange
      create_new_shipping_company
      create_new_user
      Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

      # Act
      login_as(@new_user, :scope => :user)
      visit root_path
      click_on "Acesso Transportadora"
      click_on "Veículos"
      click_on "MKE-0945"
      click_on "Editar"

      # Assert
      expect(page).to have_content "Editar Veículo"
      expect(page).to have_field "Placa de identificação", with: "MKE-0945"
      expect(page).to have_field "Marca", with: "Mercedes"
      expect(page).to have_field "Modelo", with: "TRUCK-MERC-10"
      expect(page).to have_field "Ano de fabricação", with: "2020"
      expect(page).to have_field "Peso (gramas)", with: "5000"
    end

    it "with success" do
      # Arrange
      create_new_shipping_company
      create_new_user
      Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

      # Act
      login_as(@new_user, :scope => :user)
      visit root_path
      click_on "Acesso Transportadora"
      click_on "Veículos"
      click_on "MKE-0945"
      click_on "Editar"
      fill_in "Placa de identificação",	with: "MMM-1234"
      fill_in "Marca", with: "Mercedes Benz"
      click_on "Cadastrar"

      # Assert
      expect(page).to have_content "Veículo atualizado com sucesso."
      expect(page).to have_content "Veículo - MMM-1234"
      expect(page).to have_content "Placa: MMM-1234"
      expect(page).to have_content "Capacidade peso: 5.0kg"
      expect(page).to have_content "Marca: Mercedes Benz"
    end

    it "with wrong parameters" do
      # Arrange
      create_new_shipping_company
      create_new_user
      Carrier.create!(license_plate: "MKE-0945", brand: "Mercedes", code_model: "TRUCK-MERC-10", manufact_year: 2020, weight: 5000, shipping_company_id: 1)

      # Act
      login_as(@new_user, :scope => :user)
      visit root_path
      click_on "Acesso Transportadora"
      click_on "Veículos"
      click_on "MKE-0945"
      click_on "Editar"
      fill_in "Placa de identificação",	with: ""
      fill_in "Marca", with: ""
      click_on "Cadastrar"

      # Assert
      expect(page).to have_content "Não foi possível atualizar o veículo."
      expect(page).to have_content "Placa de identificação não pode ficar em branco"
      expect(page).to have_content "Marca não pode ficar em branco"
    end
end
