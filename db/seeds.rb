# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying all...'
Participant.destroy_all
Event.destroy_all
User.destroy_all
puts 'Done!'

names = %w[Thib Quentin Theo Antoine Cléa Astrid Louis Jeanne Margaux Clo Ambre Kim Marco Charles]

puts 'Creating users...'
names.each do |name|
  User.create(
    username: name,
    email: "#{name}@gmail.com",
    password: 'password'
  )
end
puts 'Done!'

events_names = ["Anniversaire La Tute", "LaVidaLoca", "Un WE en Sologne", "Rugby Kickoff", "La pêche aux moules",
                "Un été Indien", "NYE in NY", "Diner Mondain", "Encore un festoch", "Teuf PACS Amber&Antoine"]

puts 'Creating events...'
events_names.each { |name| Event.create(name:, creator: User.all.sample) }
puts 'Done!'

puts 'Creating participants...'
20.times do
  user = User.all.sample
  event = Event.all.where.not(creator: user).sample
  Participant.create(user:, event:)
end
puts 'Done!'
