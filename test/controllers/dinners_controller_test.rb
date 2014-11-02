require 'test_helper'

class DinnersControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
  setup do
    @request.env['HTTP_REFERER'] = 'http://test.com/'
    @dinner = dinners(:suppr_one)
    @dinner.date = 10.days.from_now
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinner" do
    assert_difference('Dinner.count') do
      post :create, dinner: { category: @dinner.category, date: @dinner.date, description: @dinner.description, location: @dinner.location, price: @dinner.price, seats: @dinner.seats, seats_available: @dinner.seats_available, stamp: @dinner.stamp, title: @dinner.title }
    end
    assert_redirected_to dinner_path(assigns(:dinner))
  end

  test "should show dinner" do
    get :show, id: @dinner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dinner
    assert_response :success
  end

  test "should update dinner" do
    patch :update, id: @dinner, dinner: { category: @dinner.category, date: @dinner.date, description: @dinner.description, location: @dinner.location, price: @dinner.price, seats_available: @dinner.seats_available, stamp: @dinner.stamp, title: @dinner.title }
    assert_redirected_to dinner_path(assigns(:dinner))
  end

  test "should destroy dinner" do
    assert_difference('Dinner.count', -1) do
      delete :destroy, id: @dinner
    end

    assert_redirected_to dinners_path
  end

  #FIXME: finish test
  test "should not join if not available" do
    for i in 1..@dinner.seats + 2
      get :join, id: @dinner.id      
    end
    # assert @dinner.seats_available == 0
  end
end
