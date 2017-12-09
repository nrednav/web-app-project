require 'test_helper'

class OrderTest < ActiveSupport::TestCase

	def setup
		@order_1 = orders(:one)
		@order_2 = orders(:two)

		@food = foods(:one)
	end

	test "valid order" do 
		assert(@order_1.valid?)
		assert(@order_2.valid?)
	end

	test "create an order" do 
		Order.create(total: 12.00, contact_number: "1248121822", delivery_address: "test_address_3")

		assert_equal(12.00, Order.last.total)
	end

	test "read an order" do
		@order = Order.find(@order_1.id)

		assert_equal(@order_1.contact_number, @order.contact_number)
	end

	test "update an order" do
		@new_total = 80.00

		@order = Order.find(@order_2.id)
		@order.update(total: @new_total)	

		assert_equal(@new_total, Order.find(@order_2.id).total)
	end

	test "destroy an order" do
		@order = Order.last
		@order.destroy

		assert(@order.destroyed?)
	end

	test "both orders have one food item" do	
		@order_1.foods << @food
		@order_2.foods << @food

		assert_equal(1, @order_1.foods.count)
		assert_equal(1, @order_2.foods.count)
	end

end
