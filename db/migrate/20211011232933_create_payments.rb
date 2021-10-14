class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments, id: false do |t|
      t.string      :payment_id, primary_key: true
      t.string      :client_id, null: false
      t.string      :currency
      t.integer     :full_amount
      t.integer     :full_discounts
      t.integer     :total
      t.datetime    :date

      t.timestamps
    end

    add_foreign_key :payments, :clients, column: :client_id, primary_key: :client_id
    add_index :payments, :client_id
  end
end