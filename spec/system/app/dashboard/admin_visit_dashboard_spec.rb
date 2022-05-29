require 'rails_helper'

describe "Admin visit dashboard page" do
    it "and see metrics" do
        # Arrange
        create_new_admin
        create_access_validations_dependencies

        # Act
        login_as(@new_admin, :scope => :admin)
        visit app_root_path

        # Assert
        expect(page).to have_content "Ativas: 3"
        expect(page).to have_content "Inativas: 0"
        expect(page).to have_content "Pendentes: 1"
        expect(page).to have_content "Aceitas: 1"
        expect(page).to have_content "Recusadas: 0"
        expect(page).to have_content "Concluídas: 1"
    end
    
end
