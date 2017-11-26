class CreateOrders < ActiveRecord::Migration[5.1]

  def up
    create_table :orders do |t|

        t.integer :customerNumber
        t.text :foodList
        t.date :orderDate
        t.float :orderTotal
        t.integer :orderQuantity

        t.timestamps
    end
  end

  def down
    drop_table :orders
  end

end
