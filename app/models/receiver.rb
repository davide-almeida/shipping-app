class Receiver < ApplicationRecord
  belongs_to :order_service

  validates :full_address, :first_name, :last_name, :registration_code, :order_service, presence: true
  validates :registration_code, length: {is: 9, message: "deve possuir 9 caracteres."}
end
