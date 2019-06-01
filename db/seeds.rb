require 'faker'

puts "Destroying all Messages"
Message.destroy_all

puts "Destroying all Users"
User.destroy_all

puts "Destroying all Channels"
Channel.destroy_all

puts "Creating Channels"
Channel.create!(name: "general")
Channel.create!(name: "react")
Channel.create!(name: "paris")
puts "Created #{Channel.count} Channels"

puts "Creating Users"
User.create!(email: "matt@gmail.com", password: "123456", username: "Matt")
User.create!(email: "tom@gmail.com", password: "123456", username: "Tom")
User.create!(email: "john@gmail.com", password: "123456", username: "John")
puts "Created #{User.count} Users"

puts "Creating Messages"
50.times do
  Message.create!(content: Faker::Quote.most_interesting_man_in_the_world, user: User.all.sample, channel: Channel.all.sample)
end
puts "Created #{Message.count} Messages"

