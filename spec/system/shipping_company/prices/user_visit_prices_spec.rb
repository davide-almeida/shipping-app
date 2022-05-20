require 'rails_helper'

describe "User visit Prices page" do
    it "and see prices list" do
        # Arrange
        create_new_shipping_company
        create_new_user

        # Act
        login_as(@new_user, :scope => :user)
        visit root_path
        click_on "Acesso Transportadora"
        click_on "Preços"

        # Assert
        expect(page).to have_content "Lista preços"
    end
    
end
