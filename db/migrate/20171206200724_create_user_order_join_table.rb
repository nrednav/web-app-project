class CreateUserOrderJoinTable < ActiveRecord::Migration[5.1]
  def up
  		create_table :orders_users, :id => false do |t|
  			t.integer "order_id"
  			t.integer "user_id"
  		end

  		add_index("orders_users", ["order_id", "user_id"])	
  end

  def down
  		drop_table :orders_users
  end
end
