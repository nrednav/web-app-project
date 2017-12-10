require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  test "should get new" do
    get '/login'
    assert_response :success
    assert_select 'title', I18n.t('main.navigation.login')
  end

  test "should login" do	
  	post '/sessions'
  	assert_response :redirect
  end

  test "should logout" do
  	get '/logout'
  	assert_response :redirect
  end

end
