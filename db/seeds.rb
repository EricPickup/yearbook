# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUMBER_OF_USERS_TO_GENERATE = 50
NUMBER_OF_RANDOM_FRIENDS_PER_USER = 15
NUMBER_OF_POSTS_PER_USER_TO_GENERATE = 3
MAJORS = ["Physics", "Computer Science", "Criminology", "Mathematics", "Psychology", "Biology", "Chemistry", "Drama", "Gender Studies", "Human Kinetics", "History", "English", "Law"]

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time_within_24_hours
  return Time.at(
    rand_in_range(
      (Time.now - ((1..24).to_a.sample).hours - ((1..60).to_a.sample).seconds).to_f,
      Time.now.to_f
    )
  ).to_datetime
end

NUMBER_OF_USERS_TO_GENERATE.times do
  User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    college: Faker::University.name,
    major: MAJORS.sample,
    relationship: rand(1..2) == 1 ? "Single" : "In a relationship",
    location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
    ).save
end

User.all.each do |user|
  (User.first.id..User.last.id).to_a.sample(NUMBER_OF_RANDOM_FRIENDS_PER_USER).each do |random_user_id|
    random_user = User.find(random_user_id)
    next if random_user_id == user.id || (user.friends.include? random_user)
    user.friends << random_user
  end

  (NUMBER_OF_POSTS_PER_USER_TO_GENERATE).times do
    user.posts << Post.new(
      content: Faker::Lorem.sentence((15..50).to_a.sample),
      created_at: rand_time_within_24_hours)
  end
end
