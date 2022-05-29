class Carrier < ApplicationRecord
  belongs_to :shipping_company

  validates :license_plate, :brand, :code_model, :manufact_year, :weight, :shipping_company_id, presence: true
  validates :license_plate, :code_model, uniqueness: true
  validates :license_plate, length: {minimum: 5, message: "deve possuir no mínimo 5 caracteres."}
  validates :code_model, length: {minimum: 6, message: "deve possuir no mínimo 6 caracteres."}

  has_many :order_services
end
