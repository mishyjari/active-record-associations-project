class User < ActiveRecord::Base
  has_many :checkouts
  has_many :books, through: :checkouts

  def new_checkout(book)
    book.checkedout = true
    book.save
    Checkout.create(book_id: book.id, user_id: self.id, check_out_date: Time.now, returned: false)
  end

  def return_book(book)
    book.checkedout = false
    book.save
    checkout = Checkout.all.find_by(user_id: self.id, book_id: book.id)
    checkout.returned = true
    checkout.save
  end

  def checkout_history
    Checkout.all.where(user_id: self.id)
  end

  def current_checkouts
    self.checkout_history.where(returned: false)
  end

end
