class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: false do |t|
      t.string     :transaction_id, primary_key: true
      t.string     :payment_id, null: false
      t.integer    :amount
      t.integer    :transaction_type

      t.timestamps
    end

    add_foreign_key :transactions, :payments, column: :payment_id, primary_key: :payment_id
    add_index :transactions, :payment_id
  end
end
