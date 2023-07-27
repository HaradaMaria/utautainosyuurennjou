# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "syuurennjou@admin",
  password: "114514"
)

require "csv"

CSV.foreach('db/usersample.csv') do |row|
  User.create(:id => row[0], :name => row[1], :email => row[2], :password => row[3], :password_confirmation => row[3], :is_training => row[4])
end

CSV.foreach('db/songsample.csv') do |row|
  Song.create(:id => row[0], :name => row[1], :name_kana => row[2], :artist => row[3], :songwriter => row[4], :composer => row[5], :tie_up => row[6])
end

CSV.foreach('db/recordsample.csv') do |row|
  Record.create(:user_id => row[0], :song_id => row[1], :score => row[2], :key => row[3], :share => row[4], :memo => row[5], :created_at => row[6], :updated_at => row[7])
end