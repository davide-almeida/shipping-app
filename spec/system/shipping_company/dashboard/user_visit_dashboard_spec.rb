require 'rails_helper'

describe "User visit dashboard page" do
    it "and see metrics" do
        # Arrange
        create_access_validations_dependencies

        # Act
        login_as(@user_access_validations, :scope => :user)
        visit shipping_company_root_path

        # Assert
        expect(page).to have_content "Pendentes: 1"
        expect(page).to have_content "Aceitas: 0"
        expect(page).to have_content "Recusadas: 0"
        expect(page).to have_content "Concluídas: 0"
        expect(page).to have_content "Cadastrados: 1"
    end
end
