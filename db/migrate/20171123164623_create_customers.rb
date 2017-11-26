class CreateCustomers < ActiveRecord::Migration[5.1]

  def up
	create_table :customers do |t|

		t.string :name
		t.string :email
		t.boolean :isMember

		t.timestamps
    end
  end

  def down
  	drop_table :customers
  end

end
