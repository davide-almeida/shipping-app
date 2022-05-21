class CreatePriceSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :price_settings do |t|
      t.integer :value_min_cents
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
