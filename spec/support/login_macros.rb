def create_new_admin
    @new_admin = Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@davide.com", password: "123123", password_confirmation: "123123")
end