# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'hello@tester.com', password: 'test123', username: 'hellotester')
User.create(email: 'goodby@tester.com', password: 'test123', username: 'goodbyetester')
