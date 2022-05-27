class DeliveryTime < ApplicationRecord
  belongs_to :shipping_company

  validates :range_start, :range_end, :working_day, :shipping_company_id, presence: true
  validates :range_start, :range_end, :working_day, numericality: { greater_than_or_equal_to: 0 }
end
