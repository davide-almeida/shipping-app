class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :license_plate
      t.string :brand
      t.string :code_model
      t.integer :manufact_year
      t.integer :weight
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
