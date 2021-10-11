class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.integer     :amount
      t.integer     :type
      t.belongs_to  :payment

      t.timestamps
    end
  end
end
