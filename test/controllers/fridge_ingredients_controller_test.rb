require 'test_helper'

class FridgeIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fridge_ingredient = fridge_ingredients(:one)
  end

  test "should get index" do
    get fridge_ingredients_url, as: :json
    assert_response :success
  end

  test "should create fridge_ingredient" do
    assert_difference('FridgeIngredient.count') do
      post fridge_ingredients_url, params: { fridge_ingredient: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fridge_ingredient" do
    get fridge_ingredient_url(@fridge_ingredient), as: :json
    assert_response :success
  end

  test "should update fridge_ingredient" do
    patch fridge_ingredient_url(@fridge_ingredient), params: { fridge_ingredient: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fridge_ingredient" do
    assert_difference('FridgeIngredient.count', -1) do
      delete fridge_ingredient_url(@fridge_ingredient), as: :json
    end

    assert_response 204
  end
end
