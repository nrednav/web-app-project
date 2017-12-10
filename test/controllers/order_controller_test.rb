require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
  	get order_url
  	assert_response :success
  end

  test "should get edit" do
  	@order = orders(:one)
  	@food = foods(:one)
  	@order.foods << @food

  	get order_edit_url
  	assert_response :success
  end
  
end
