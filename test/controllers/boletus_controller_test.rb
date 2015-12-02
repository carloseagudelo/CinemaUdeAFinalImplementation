require 'test_helper'

class BoletusControllerTest < ActionController::TestCase
  setup do
    @boletu = boletus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boletus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boletu" do
    assert_difference('Boletu.count') do
      post :create, boletu: { boletusType: @boletu.boletusType, movie_id: @boletu.movie_id, pointsNumber: @boletu.pointsNumber, priceDinner: @boletu.priceDinner, pricePoints: @boletu.pricePoints, ticket_id: @boletu.ticket_id }
    end

    assert_redirected_to boletu_path(assigns(:boletu))
  end

  test "should show boletu" do
    get :show, id: @boletu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boletu
    assert_response :success
  end

  test "should update boletu" do
    patch :update, id: @boletu, boletu: { boletusType: @boletu.boletusType, movie_id: @boletu.movie_id, pointsNumber: @boletu.pointsNumber, priceDinner: @boletu.priceDinner, pricePoints: @boletu.pricePoints, ticket_id: @boletu.ticket_id }
    assert_redirected_to boletu_path(assigns(:boletu))
  end

  test "should destroy boletu" do
    assert_difference('Boletu.count', -1) do
      delete :destroy, id: @boletu
    end

    assert_redirected_to boletus_path
  end
end
