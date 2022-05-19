require 'rails_helper'

describe "User visit carrier page" do
    it "and see carriers recorded" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Veículos"

        # Assert
        # expect(current_path).to eq app_shipping_companies_path
        expect(page).to have_content "Lista veículos"
        
    end
end
