# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Article.new(
    name: "Math article",
    description: "This file should contain all the record creation needed to seed the database with its default values.",
    user: User.first).save
Article.create(
    name: "Spanish article",
    description: "This file should contain all the record creation needed to seed the database with its default values.",
    user: User.second)
Article.new(
    name: "English article",
    description: "This file should contain all the record creation needed to seed the database with its default values.",
    user: User.last).save
Article.create(
    name: "My first article",
    description: "This file should contain all the record creation needed to seed the database with its default values.",
    user: User.first)
Article.new(
    name: "Buying my PC",
    description: "This file should contain all the record creation needed to seed the database with its default values.",
    user: User.last).save

User.create!(email: 'ana@email.com', password: '121212', password_confirmation: '121212')
User.create!(email: 'jose@email.com', password: '121212', password_confirmation: '121212')
User.create!(email: 'maria@email.com', password: '121212', password_confirmation: '121212')
User.create!(email: 'luis@email.com', password: '121212', password_confirmation: '121212')
