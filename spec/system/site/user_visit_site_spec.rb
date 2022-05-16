require 'rails_helper'

describe "User visits the site" do
    it "and see the homepage" do
        # Arrange
        # Act
        visit root_path

        # Assert
        expect(page).to have_content "Shipping App"
        expect(page).to have_link "Acesso Transportadora"
        expect(page).to have_link "Rastreio"
        expect(page).to have_link "Acesso Admin"
    end
end
