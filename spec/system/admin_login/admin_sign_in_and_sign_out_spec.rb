require 'rails_helper'

describe "Admin visits the login page" do
  it "and see login form" do
    # Arrange
    # Act
    visit root_path
    click_on "Acesso Admin"
    # Assert
    expect(current_path).to eq new_admin_session_path
    expect(page).to have_content "Admin - Login"
    expect(page).to have_button "Entrar"
  end

  it "and sign in" do
    # Arrange
    Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")

    # Act
    visit root_path
    click_on "Acesso Admin"

    fill_in "Email",	with: "davide@davide.com"
    fill_in "Password",	with: "123123"
    click_on "Entrar"

    # Assert
    expect(current_path).to eq app_root_path
    expect(page).not_to have_button "Entrar"
    expect(page).to have_content "Login efetuado com sucesso."
    expect(page).to have_content "davide@davide.com"
    expect(page).to have_button "Sair"
  end

  it "and try sign in with wrong parameters" do
    # Arrange
    Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")

    # Act
    visit root_path
    click_on "Acesso Admin"

    fill_in "Email",	with: "davide@davide.com"
    fill_in "Password",	with: "asdasd"
    click_on "Entrar"

    # Assert
    expect(current_path).to eq new_admin_session_path
    expect(page).to have_content "Email ou senha inválidos."
    expect(page).to have_button "Entrar"
  end

  it "sign in and sign out" do
    # Arrange
    Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")

    # Act
    visit root_path
    click_on "Acesso Admin"

    fill_in "Email",	with: "davide@davide.com"
    fill_in "Password",	with: "123123"
    click_on "Entrar"
    click_on "Sair"

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Logout efetuado com sucesso."
    expect(page).not_to have_button "Entrar"
    expect(page).not_to have_button "Sair"
  end
end
