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

CSV.foreach('db/seeddata/gender.csv', headers: true) do |row|
    Gender.create(
                    gender_name: row['gender_name'],
                    display_order: row['display_order']
                   )
end

CSV.foreach('db/seeddata/profile.csv') do |row|
    Profile.create(
                    :account_id => row[0],
                    :nickname => row[1],
                    :self_introduction => row[2],
                    :gender_id => row[3],
                    :game_playing => row[4],
                    :time_period_playing => row[5]
                   )
end

CSV.foreach('db/seeddata/diary.csv', headers: true) do |row|
    Diary.create(
                    account_id: row['account_id'],
                    body: row['body'],
                    played_game: row['played_game'],
                    posted_image: row['posted_image']
                   )
end