class AlterOrderTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :list_of_foods

  	rename_column :orders, :deliveryAddress, :delivery_address
  	rename_column :orders, :deliveryContact, :contact_number
  end
end
