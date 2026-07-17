# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'csv'

# users_file = File.open(File.expand_path('db/users.csv'))
# options = { headers: true, col_sep: ','}

# count = 1

# CSV.foreach(users_file, **options) do |row|
# 	user_hash = {}
# 	user_hash[:oracle_number] = row['oracle_number']
# 	user_hash[:ledger_number] = row['ledger_number']
# 	user_hash[:name]  = row['name']
#     user_hash[:password]  = row['password']

# 	User.create!( user_hash )
# 	puts "#{user_hash} - #{User.count}"
# end

users_file = File.open(File.expand_path('db/nov-2024.csv'))
options = { headers: true, col_sep: ',' }

count = 0

CSV.foreach(users_file, **options) do |row|
	user = User.find_by(ledger_number: row['ledger_number'])
	transaction = {}
	transaction[:ledger_number] = row['ledger_number']
	transaction[:date] = row['date']
	transaction[:savings_debit] = row['savings_debit']
	transaction[:lodgement] = row['lodgement']
	transaction[:savings_balance] = row['savings_balance']
	transaction[:shares_balance] = row['shares_balance']
	transaction[:loan_debit] = row['loan_debit']
	transaction[:loan_repayment] = row['loan_repayment']
	transaction[:loan_balance] = row['loan_balance']
	transaction[:interest_credit] = row['interest_credit']
	transaction[:interest_balance] = row['interest_balance']
	transaction[:deduction] = row['deduction']
    # next if Transaction.find_by(date: transaction[:date])
    user.transactions.create!(transaction)
    puts count+=1
    puts transaction
    puts "***"
end

puts "********************************************************"