require 'test_helper'

class FridgeTest < ActiveSupport::TestCase
  setup do
    @fridge = fridges(:one)
    @ingredient1 = ingredients(:one)
    @recipe1 = recipes(:one)
  end

  test 'should add 40 ingredients' do
    40.times { |i| Ingredient.create({ name: "ingredient#{i}" }) }
    @fridge.fill_with_random_ingredients!
    assert @fridge.ingredients.length > 2
  end

  test 'should add recipes ingredients' do
    @fridge.fill_with_recipe_ingredients! @recipe1
    assert @fridge.ingredients == @recipe1.ingredients
  end

  test 'should add ingredient and get recipe' do
    assert_equal(0, @fridge.ingredients.count)
    assert_equal(0, @fridge.recipes.count)
    res = @fridge.add_ingredients_to_fridge! @ingredient1
    assert_equal(res, [@recipe1])
    assert_equal(1, @fridge.ingredients.count)
    assert_equal(@fridge.recipes, @ingredient1.recipes)
  end

  test 'should rm ingredient and get recipe removed' do
    @ingredient2 = ingredients(:two)
    @recipe2 = recipes(:two)
    @recipe3 = recipes(:three)

    assert_equal(0, @fridge.ingredients.count)
    assert_equal(0, @fridge.recipes.count)
    @fridge.add_ingredients_to_fridge! @ingredient2
    res = @fridge.rm_ingredients_to_fridge! @ingredient2
    assert_equal(res, [@recipe2, @recipe3])
    assert_equal([], @fridge.ingredients)
    assert_equal([], @fridge.recipes)
  end
end


# def all_ingredients_recipes!
#   # Make a hash of recipes with the fridge ingredients count
#   # For each recipe of hash if the count = recipe.count then reciep is possible
#   candidate_recipes = {}
#   ingredients.each do |i|
#     i.recipes.each do |r|
#       if candidate_recipes.has_key?(r)
#         candidate_recipes[r][0] += 1
#       else
#         candidate_recipes[r] = [1, r.ingredient_ids.length] # first is count of fridge ing, second is count of recipe
#       end
#     end
#   end
#   possible_recipes = candidate_recipes.select { |_k, v| v[0] == v[1] }.map { |k, _v| k }
#   self.recipes = possible_recipes
#   possible_recipes
# end