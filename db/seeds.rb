# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!([
#   {
#     name: "steve",
#     email: "steve@gmail.com",
#     password: "123456",
#   },
#   {
#     name: "sally",
#     email: "sally@gmail.com",
#     password: "123456",
#   },
#   {
#     name: "yeezy",
#     email: "yeezy@gmail.com",
#     password: "123456",
#   },
#   {
#     name: "bobby",
#     email: "bobby@gmail.com",
#     password: "123456",
#   },
#   {
#     name: "morgan",
#     email: "morgan@gmail.com",
#     password: "123456",
#   },
# ])

user1 = User.first
user2 = User.second
user3 = User.third

Meetup.create!({
  title: "Tuesday Night Dinner",
  description: "Friends Gather",
  date: Date.new(2022, 06, 3),
  owner: user1,
})

meetup1 = Meetup.first
print meetup1.title

Invite.create!([
  {
    meetup: meetup1,
    user: user2,
  },
  {
    meetup: meetup1,
    user: user3,
  },
])

Place.create!([
  {
    name: "Monsoon",
    description: "Korean Fusion",
  },
  {
    name: "Kin Dee",
    description: "Thai Food",
  },
])
place = Place.first
place2 = Place.second

PlaceCandidate.create!({
  place: place,
  meetup: meetup1,
  user: user2,

})
PlaceCandidate.create!({
  place: place2,
  meetup: meetup1,
  user: user1,
})
