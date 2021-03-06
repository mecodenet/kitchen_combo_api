require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get recipes_url, as: :json
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { author: @recipe.author, author_tip: @recipe.author_tip, budget: @recipe.budget, cook_time: @recipe.cook_time, difficulty: @recipe.difficulty, image: @recipe.image, name: @recipe.name, nb_comments: @recipe.nb_comments, people_quantity: @recipe.people_quantity, prep_time: @recipe.prep_time, rate: @recipe.rate, total_time: @recipe.total_time } }, as: :json
    end

    assert_response 201
  end

  test "should show recipe" do
    get recipe_url(@recipe), as: :json
    assert_response :success
  end

  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { author: @recipe.author, author_tip: @recipe.author_tip, budget: @recipe.budget, cook_time: @recipe.cook_time, difficulty: @recipe.difficulty, image: @recipe.image, name: @recipe.name, nb_comments: @recipe.nb_comments, people_quantity: @recipe.people_quantity, prep_time: @recipe.prep_time, rate: @recipe.rate, total_time: @recipe.total_time } }, as: :json
    assert_response 200
  end

end
