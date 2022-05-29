require 'rails_helper'

describe "Client visit trancking page" do
    it "and see track_route form" do
        # Arrange
        # Act
        visit root_path
        click_on "Rastreio"

        # Assert
        expect(page).to have_content "Rastreio"
    end
    
end
