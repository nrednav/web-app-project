class CreateFoodOrderJoinTable < ActiveRecord::Migration[5.1]
  def up
  		create_table :foods_orders, :id => false do |t|
  			t.integer "food_id"
  			t.integer "order_id"
  		end

  		add_index("foods_orders", ["food_id", "order_id"])	
  end

  def down
  		drop_table :foods_orders
  end
end
