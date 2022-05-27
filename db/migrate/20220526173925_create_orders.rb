class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :code
      t.string :full_address
      t.float :width
      t.float :height
      t.float :depth
      t.float :weight
      t.float :range
      t.integer :total_value_cents
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
