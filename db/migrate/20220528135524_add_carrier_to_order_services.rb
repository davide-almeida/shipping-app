class AddCarrierToOrderServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_services, :carrier, null: true, foreign_key: true
  end
end
