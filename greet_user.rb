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

def user_has(user)
  if user.current_checkouts.length == 0
    puts "You have no books checked out."
  else
    puts "You currently have the following books checked out:\n"
    user.current_checkouts.each do |c|
      if c.due_date < Time.now
        puts "    \nOVERDUE!!!\n    "
      end
      puts "- ID: " + c.book_id.to_s
      puts "  Title: " + c.book.title
      puts "  Author: " + c.book.author.name
      puts "  Checked out: " + c.check_out_date.to_date.to_s
      puts "  Due Back: " + c.due_date.to_date.to_s
    end
  end
end

def return_book(user)
  puts "Enter the ID of the book you are returning."
  id = gets.chomp
  if id 
    user.return_book(Book.find(id))
  else
    puts 'Invalid request, enter the id of the book you are returning.'
    id = gets.chomp
  end
end

def list_avail_books
  puts "\nHere are the books available:\n"

  Book.all.available_books.each do |b|
    puts "- ID: " + b.id.to_s
    puts "  Title: " + b.title
    puts "  Author: " + b.author.name
  end
end

def new_checkout(user)
  list_avail_books
  puts "Enter the id of the book you want to check out"
  id = gets.chomp()
  if !Book.find(id.to_i)
    puts "No book with that ID found, try again!"
    id = gets.chomp
  end
  book = Book.find(id.to_i)
  user.new_checkout(book)
  puts "You have now checked out " + book.title
end

def prompt(user)
  puts "\nOptions:"
  puts "  (n) New Checkout"
  puts "  (r) Return Book"
  puts "  (l) Show available books"
  puts "  (c) My checked out books"
  puts "  (x) Exit"

  puts "\nYour choice:"
  res = gets.chomp.downcase

  case res
  when "n"
    new_checkout(user)
    prompt(user)
  when "l" 
    list_avail_books
    prompt(user)
  when "r"
    user_has(user)
    return_book(user)
    prompt(user)
  when "c"
    user_has(user)
    prompt(user)
  when "x"
    puts "Goodbye"
  else
    puts 'Invalid choice, try again: '
    prompt(user)
  end
end

prompt(user)
