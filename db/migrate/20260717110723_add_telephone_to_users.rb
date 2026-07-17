class AddTelephoneToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :telephone, :integer
  end
end
