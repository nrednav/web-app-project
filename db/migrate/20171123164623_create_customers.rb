class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|

    	t.string :customerName
    	t.string :emailAddress
    	t.boolean :isMember

   	t.timestamps
    end
  end
end
