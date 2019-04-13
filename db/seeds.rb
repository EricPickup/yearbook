# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUMBER_OF_USERS_TO_GENERATE = 100
NUMBER_OF_RANDOM_FRIENDS_PER_USER = 20
majors = ["Physics", "Computer Science", "Criminology", "Mathematics", "Psychology", "Biology", "Chemistry", "Drama", "Gender Studies", "Human Kinetics", "History", "English", "Law"]

NUMBER_OF_USERS_TO_GENERATE.times do
  User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    college: Faker::University.name,
    major: majors.sample,
    relationship: rand(1..2) == 1 ? "Single" : "In a relationship",
    location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
    ).save
end

User.all.each do |user|
  (User.first.id..(User.last.id + NUMBER_OF_USERS_TO_GENERATE)).to_a.sample(NUMBER_OF_RANDOM_FRIENDS_PER_USER).each do |random_user_id|
    random_user = User.find(random_user_id)
    next if random_user_id == user.id || (user.friends.include? random_user)
    user.friends << random_user
  end
end
