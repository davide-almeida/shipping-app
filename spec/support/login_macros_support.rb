def create_new_admin
    @new_admin = Admin.create!(firstname: "Davide", lastname: "Almeida", email: "davide@sistemadefrete.com.br", password: "123123", password_confirmation: "123123")
end

def create_new_user
    @new_user = User.create!(firstname: "User", lastname: "Transportadora", email: "transportadora@acme.com", password: "123123", password_confirmation: "123123", shipping_company_id: 1)
end
