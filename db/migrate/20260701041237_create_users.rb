class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :ledger_number
      t.decimal :oracle_number, precision: 12, scale: 2
      t.string  :email
      t.integer :status, default: 1
      t.integer :role, default: 1

      t.timestamps
    end
  end
end
