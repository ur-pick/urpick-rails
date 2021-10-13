# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!([
  {
    name: "steve",
    email: "steve@gmail.com",
    password: "123456"
  },
  {
    name: "sally",
    email: "sally@gmail.com",
    password: "123456"
  },
  {
    name: "yeezy",
    email: "yeezy@gmail.com",
    password: "123456"
  },
  {
    name: "bobby",
    email: "bobby@gmail.com",
    password: "123456"
  },
  {
    name: "morgan",
    email: "morgan@gmail.com",
    password: "123456"
  }
])

