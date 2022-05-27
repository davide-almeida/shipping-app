class CreateReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :receivers do |t|
      t.string :full_address
      t.string :first_name
      t.string :last_name
      t.string :registration_code
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
