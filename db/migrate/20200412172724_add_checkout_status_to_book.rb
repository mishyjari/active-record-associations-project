class AddCheckoutStatusToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :checkedout, :boolean
  end
end
