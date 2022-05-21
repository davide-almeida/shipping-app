class Price < ApplicationRecord
  belongs_to :shipping_company

  monetize :value_kilometer_cents
  validates :value_kilometer_cents, numericality: { greater_than_or_equal_to: 0 }

  validates :cubic_start, :cubic_end, :weight_start, :weight_end, :value_kilometer_cents, :shipping_company_id, presence: true

  # Compare cubic meters
  validates :cubic_end, comparison: { greater_than_or_equal_to: :cubic_start }
  validates :cubic_start, comparison: { less_than_or_equal_to: :cubic_end }

  # Compare wight
  validates :weight_end, comparison: { greater_than_or_equal_to: :weight_start }
  validates :weight_start, comparison: { less_than_or_equal_to: :weight_end }
  
end
