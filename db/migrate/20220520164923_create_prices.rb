class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :cubic_start
      t.float :cubic_end
      t.integer :weight_start
      t.integer :weight_end
      t.integer :value_kilometer_cents
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
