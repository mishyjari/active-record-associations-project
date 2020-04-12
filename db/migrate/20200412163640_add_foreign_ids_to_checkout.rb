class AddForeignIdsToCheckout < ActiveRecord::Migration[5.2]
  def change
    add_column :checkouts, :book_id, :integer
    add_column :checkouts, :user_id, :integer
  end
end
