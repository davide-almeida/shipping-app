class CreateDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_times do |t|
      t.float :range_start
      t.float :range_end
      t.integer :working_day
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
