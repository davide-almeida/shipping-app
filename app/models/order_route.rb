class OrderRoute < ApplicationRecord
  belongs_to :order_service

  validates :status, :current_location, :current_time, :order_service_id, presence: true
  enum status: ["A caminho", "Concluída"]
end
