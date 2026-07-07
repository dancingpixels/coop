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

users_file = File.open(File.expand_path('db/users.csv'))
options = { headers: true, col_sep: ','}

count = 1

CSV.foreach(users_file, **options) do |row|
	user_hash = {}
	user_hash[:oracle_number] = row['oracle_number']
	user_hash[:ledger_number] = row['ledger_number']
	user_hash[:name]  = row['name']
    user_hash[:password]  = row['password']

	User.create!( user_hash )
	puts "#{user_hash} - #{User.count}"
end