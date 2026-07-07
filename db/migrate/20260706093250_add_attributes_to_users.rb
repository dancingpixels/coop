class AddAttributesToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :oracle_number, :string
    add_column :users, :ledger_number, :integer
    add_column :users, :name, :string
    add_column :users, :status, :string, default: "ACTIVE"
    add_column :users, :role, :string, default: "member"
  end
end
