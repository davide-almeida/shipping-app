class ShippingCompany < ApplicationRecord
    validates :brand_name, :corporate_name, :domain, :registration_number, :full_address, :status, presence: true
    validates :registration_number, length: {is: 18, message: "deve possuir 18 caracteres."}
    validates :registration_number, uniqueness: true
    enum status: ["Ativo", "Inativo"]

    has_many :users
end
