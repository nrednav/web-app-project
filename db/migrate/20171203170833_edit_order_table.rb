class EditOrderTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :customerNumber
  	remove_column :orders, :foodList
  	remove_column :orders, :orderQuantity
  	remove_column :orders, :orderDate

  	add_column :orders, :deliveryAddress, :text
  	add_column :orders, :deliveryContact, :string
    add_column :orders, :list_of_foods, :text

  	rename_column :orders, :orderTotal, :total
  end
end
