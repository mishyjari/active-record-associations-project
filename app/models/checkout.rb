class Checkout < ActiveRecord::Base
  belongs_to :book
  has_many :authors, through: :books
  belongs_to :user

  def due_date
    self.check_out_date + 1.week
  end
end
