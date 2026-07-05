class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :oracle_number
      t.integer :ledger_number
      t.string :name
      t.string :email
      t.string :status, default: "ACTIVE"
      t.string :role, default: "member"

      t.timestamps
    end
  end
end
