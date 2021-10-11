class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer    :amount
      t.integer    :type
      t.belongs_to :payment

      t.timestamps
    end
  end
end
