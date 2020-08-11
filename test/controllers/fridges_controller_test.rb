require 'test_helper'

class FridgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fridge = fridges(:one)
  end

  test "should get index" do
    get fridges_url, as: :json
    assert_response :success
  end

  test "should create fridge" do
    assert_difference('Fridge.count') do
      post fridges_url, params: { fridge: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fridge" do
    get fridge_url(@fridge), as: :json
    assert_response :success
  end

  test "should update fridge" do
    patch fridge_url(@fridge), params: { fridge: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fridge" do
    assert_difference('Fridge.count', -1) do
      delete fridge_url(@fridge), as: :json
    end

    assert_response 204
  end
end
