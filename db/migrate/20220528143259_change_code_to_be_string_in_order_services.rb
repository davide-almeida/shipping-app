class ChangeCodeToBeStringInOrderServices < ActiveRecord::Migration[7.0]
  def change
    change_column :order_services, :code, :string
  end
end
