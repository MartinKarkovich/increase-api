class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts, id: false do |t|
      t.string      :discount_id, primary_key: true
      t.string      :payment_id, null: false
      t.integer     :amount
      t.integer     :discount_type

      t.timestamps
    end

    add_foreign_key :discounts, :payments, column: :payment_id, primary_key: :payment_id
    add_index :discounts, :payment_id
  end
end
