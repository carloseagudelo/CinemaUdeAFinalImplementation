require 'test_helper'

class HorariesControllerTest < ActionController::TestCase
  setup do
    @horary = horaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horary" do
    assert_difference('Horary.count') do
      post :create, horary: { begin: @horary.begin }
    end

    assert_redirected_to horary_path(assigns(:horary))
  end

  test "should show horary" do
    get :show, id: @horary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horary
    assert_response :success
  end

  test "should update horary" do
    patch :update, id: @horary, horary: { begin: @horary.begin }
    assert_redirected_to horary_path(assigns(:horary))
  end

  test "should destroy horary" do
    assert_difference('Horary.count', -1) do
      delete :destroy, id: @horary
    end

    assert_redirected_to horaries_path
  end
end
