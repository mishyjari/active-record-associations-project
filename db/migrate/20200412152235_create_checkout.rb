class CreateCheckout < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.datetime :check_out_date
      t.boolean :returned?
    end
  end
end
