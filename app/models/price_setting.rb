class PriceSetting < ApplicationRecord
  belongs_to :shipping_company

  monetize :value_min_cents
  validates :value_min_cents, presence: true
  validates :value_min_cents, numericality: { greater_than_or_equal_to: 0 }
end
