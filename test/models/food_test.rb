require 'test_helper'

class FoodTest < ActiveSupport::TestCase

	def setup 
		@food_item = foods(:one)
		@order_1 = orders(:one)
		@order_2 = orders(:two)
	end
 	
 	test "valid food item" do
 		assert @food_item.valid?
 	end

 	test "create food item" do
 		@name = "Test food"
 		@price = 8.00
 		@cuisine = "jp"
 		@course = "main_chicken"

 		Food.create(name: @name, price: @price, cuisine: @cuisine, course: @course)

 		@food = Food.last
 		assert_equal(@name, @food.name)
 	end

 	test "read food item" do
 		@food = Food.last
 		assert_equal(@food_item.name, @food.name)
 	end

 	test "update food item" do
 		@course = "beverage"
 		@food = Food.last
 		@food.update(course: @course)

 		assert_equal(@course, Food.last.course)
 	end

 	test "destroy food item" do 
 		@food = Food.last
 		@food.destroy

 		assert(@food.destroyed?)
 	end

 	test "food item belongs to two orders" do 
 		@food = Food.last
 		@food.orders << @order_1
 		@food.orders << @order_2

 		assert_equal(2, @food.orders.count)
 		assert_equal(@food.name, @order_1.foods.first.name)
 		assert_equal(@food.name, @order_2.foods.first.name)
 	end
end
