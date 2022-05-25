class SearchPriceLog < ApplicationRecord
    monetize :value_kilometer_cents, :value_min_cents, :total_value_cents
    validates :brand_name, :corporate_name, :domain, :registration_number, :cubic_meter, :value_kilometer_cents, :value_min_cents, :deadline, :range, :total_value_cents, :search_date, presence: true
    validates :registration_number, length: {is: 18, message: "deve possuir 18 caracteres."}
end
