require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
  include Warden::Test::Helpers
  Warden.test_mode!

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
