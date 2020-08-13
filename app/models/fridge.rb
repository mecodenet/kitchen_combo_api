class Fridge < ApplicationRecord
  has_many :fridge_ingredients
  has_many :ingredients, through: :fridge_ingredients
  has_and_belongs_to_many :recipes

  def fill_with_random_ingredients!
    new_possible_recipes = []
    40.times do
      new_possible_recipes = add_ingredients_to_fridge! Ingredient.order(Arel.sql('RANDOM()')).first
    end
    new_possible_recipes
  end

  def fill_with_recipe_ingredients!(recipe)
    recipe.ingredients.map { |i| add_ingredients_to_fridge!(i) }.uniq.flatten
    recipe
  end

  def add_ingredients_to_fridge!(ingredient)
    new_possible_recipes = []
    unless ingredients.include? ingredient
      candidate_recipes = {}
      ingredients << ingredient
      ingredient.recipes.each do |r|
        if candidate_recipes.has_key?(r)
          candidate_recipes[r][0] += 1
        else
          candidate_recipes[r] = [1, r.ingredient_ids.length] # first is count of fridge ing, second is count of recipe
        end
      end
      new_possible_recipes = candidate_recipes.select { |_k, v| v[0] == v[1] }.map { |k, _v| k }
    end
    self.recipes += new_possible_recipes
    new_possible_recipes
  end

  def rm_ingredients_to_fridge!(ingredient)
    impossible_recipes = []
    if ingredients.include? ingredient
      ingredients.delete(ingredient)
      impossible_recipes = ingredient.recipes
    end
    self.recipes -= impossible_recipes
    impossible_recipes
  end

  def all_ingredients_recipes!
    # Make a hash of recipes with the fridge ingredients count
    # For each recipe of hash if the count = recipe.count then reciep is possible
    candidate_recipes = {}
    ingredients.each do |i|
      i.recipes.each do |r|
        if candidate_recipes.has_key?(r)
          candidate_recipes[r][0] += 1
        else
          candidate_recipes[r] = [1, r.ingredient_ids.length] # first is count of fridge ing, second is count of recipe
        end
      end
    end
    possible_recipes = candidate_recipes.select { |_k, v| v[0] == v[1] }.map { |k, _v| k }
    self.recipes = possible_recipes
    possible_recipes
  end
end
