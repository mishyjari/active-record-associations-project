class RenameReturnedColumnInCheckout < ActiveRecord::Migration[5.2]
  def change
    rename_column :checkouts, :returned?, :returned
  end
end
