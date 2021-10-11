class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string      :currency
      t.integer     :full_amount
      t.integer     :discounts
      t.integer     :total
      t.datetime    :date
      t.belongs_to  :client

      t.timestamps
    end
  end
end