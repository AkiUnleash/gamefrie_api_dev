# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# Accountの取り込み
CSV.foreach('db/seeddata/account.csv') do |row|
    Account.create(
                    :email => row[0],
                    :hashed_password => row[1],
                    :tmp_authenication_date => row[2]
                   )
end