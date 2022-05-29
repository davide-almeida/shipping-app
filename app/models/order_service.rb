class OrderService < ApplicationRecord
  belongs_to :shipping_company
  belongs_to :carrier, optional: true

  validates :status, :code, :full_address, :width, :height, :depth, :weight, :range, :total_value_cents, :shipping_company_id, presence: true

  monetize :total_value_cents
  enum status: ["Aceita", "Pendente", "Recusada", "Concluida"]

  validates :code, length: {is: 15, message: "deve possuir 15 caracteres."}
  validates :code, format: { with: /\A[A-Za-z0-9]+\z/ }
  validates :code, uniqueness: true

  has_one :receiver, :inverse_of => :order_service
  accepts_nested_attributes_for :receiver, allow_destroy: true

  has_many :order_routes
end
