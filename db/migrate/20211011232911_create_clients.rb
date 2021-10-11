
class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients, id: false do |t|
      t.string     :id, null: false
      t.string     :email, null: false
      t.string     :first_name
      t.string     :last_name
      t.string     :job
      t.string     :country
      t.string     :address
      t.string     :zip_code
      t.string     :phone

      t.timestamps
    end

    add_index :clients, :id, unique: true
  end
end