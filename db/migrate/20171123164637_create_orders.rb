class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

    	t.integer :customerNumber
    	t.text :foodList

    	t.timestamps
    end
  end
end
