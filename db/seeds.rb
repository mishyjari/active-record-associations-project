# User Seeds
mishy = User.create(name: 'Mishy')
michelle = User.create(name: 'Michelle')
jocelyn = User.create(name: 'Jocelyn')

# Book Seeds
finn = Book.create(title: 'Finnegans Wake')
portrait = Book.create(title: 'A Portrait of the Artist')
potter = Book.create(title: 'Harry Potter')
alice = Book.create(title: 'Alice in Wonderland')

# Author Seeds
jj = Author.create(name: 'James Joyce')
jk = Author.create(name: 'JK Rowling')
lewis = Author.create(name: 'Lewis Caroll')

# Categories
fantasy = Category.create(name: 'fantasy')

# Relationship

finn.author = jj
finn.save
portrait.author = jj
portrait.save
potter.author = jk
potter.save
alice.author = lewis
alice.save

Book.all.each { |book| book.category = fantasy; book.save}
