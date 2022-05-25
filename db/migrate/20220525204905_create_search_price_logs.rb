class CreateSearchPriceLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :search_price_logs do |t|
      t.string :brand_name
      t.string :corporate_name
      t.string :domain
      t.string :registration_number
      t.float :cubic_meter
      t.integer :value_kilometer_cents
      t.integer :value_min_cents
      t.integer :deadline
      t.integer :total_value_cents
      t.float :range
      t.datetime :search_date

      t.timestamps
    end
  end
end
