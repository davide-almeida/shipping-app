class Receiver < ApplicationRecord
  belongs_to :order

  validates :full_address, :first_name, :last_name, :registration_code, :order, presence: true
  validates :registration_code, length: {is: 9, message: "deve possuir 9 caracteres."}
  validates :registration_code, uniqueness: true
end
