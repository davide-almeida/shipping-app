require 'rails_helper'

describe "User visits the site" do
    it "and see the homepage" do
        # Arrange
        # Act
        visit root_path

        # Assert
        expect(page).to have_content "Boas vindas a página inicial do site do Shipping-app!"
    end
end
