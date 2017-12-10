require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest

	test "should get home" do
		get '/'
		assert_response :success
		assert_select 'title', I18n.t('main.home.title')
	end

	test "should get contact" do
		get '/contact'
		assert_response :success
		assert_select 'title', I18n.t('main.contact.title')
	end

	test "should request contact" do
		post '/contact/request', params: {:email => "support@kenpachi.com"}
		assert_response :redirect
	end
end
