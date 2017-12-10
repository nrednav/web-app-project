require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest

	test "should get menu" do
		get '/menu'
		assert_response :success
		assert_select "p", "Chinese"
		assert_select "p", "Japanese"
		assert_select "p", "Korean"
	end

	test "should get chinese cuisine menu" do
		get '/menu/cn'
		assert_response :success
	end

	test "should get japanese cuisine menu" do
		get '/menu/jp'
		assert_response :success
	end

	test "should get korean cuisine menu" do
		get '/menu/kr'
		assert_response :success
	end
end
