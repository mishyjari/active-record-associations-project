require_relative 'config/environment.rb'

puts "SHHHHH!! THIS IS A LIBRARY!!"

puts "\n"

puts "Enter your name to begin: "
username = gets.chomp()

user = User.find_by(name: username)

if !user
  user = User.create(name: username)
  puts 'Hmm, we can\'t find you in our system...'
  puts 'That\'s okay! we\'ve gona and created an account for you!'
end

puts 'Welcome, ' + user.name

puts "\n"

if user.current_checkouts.length == 0
  puts "You have no books checked out."
else
  puts "You currently have the following books checked out:\n"
  user.current_checkouts.each do |c|
    puts c.book.title + " - " + c.book.author.name
    puts "Checked out on: " + c.check_out_date.to_s
    puts "Due back: " + c.due_date.to_s
  end
end


