class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.integer :ledger_number
      t.date :date
      t.decimal :savings_debit,   precision: 15, scale: 2, default: 0.00
      t.decimal :lodgement,       precision: 15, scale: 2, default: 0.00
      t.decimal :savings_balance, precision: 15, scale: 2, default: 0.00
      t.decimal :shares_balance,  precision: 15, scale: 2, default: 0.00
      t.decimal :loan_debit,      precision: 15, scale: 2, default: 0.00
      t.decimal :loan_repayment,  precision: 15, scale: 2, default: 0.00
      t.decimal :loan_balance,    precision: 15, scale: 2, default: 0.00
      t.decimal :interest_credit, precision: 15, scale: 2, default: 0.00
      t.decimal :interest_balance,precision: 15, scale: 2, default: 0.00
      t.decimal :deduction,       precision: 15, scale: 2, default: 0.00
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
