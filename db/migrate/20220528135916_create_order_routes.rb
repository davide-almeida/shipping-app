class CreateOrderRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_routes do |t|
      t.integer :status
      t.string :current_location
      t.datetime :current_time
      t.references :order_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
