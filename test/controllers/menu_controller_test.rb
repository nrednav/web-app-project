require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest

	test "should get menu" do
		get '/menu'
		assert_response :success
		assert_select "a[href=\"#{menu_cn_path}\"]", "Chinese"
		assert_select "a[href=\"#{menu_jp_path}\"]", "Japanese"
		assert_select "a[href=\"#{menu_kr_path}\"]", "Korean"
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
