class Fridge < ApplicationRecord
    has_many :fridge_ingredients
    has_many :ingredients, through: :fridge_ingredients

    def fill_with_random_ingredients
        new_possible_recipes = []
        40.times do
            new_possible_recipes = add_ingredients_to_fridge Ingredient.order(Arel.sql('RANDOM()')).first
        end
        return new_possible_recipes
    end

    def fill_with_recipe_ingredients recipe
        recipe.ingredients.map { |i| add_ingredients_to_fridge i}.uniq.flatten
        recipe
    end

    def add_ingredients_to_fridge ingredient
        new_possible_recipes = []
        unless ingredients.include? ingredient
            ingredients << ingredient
            new_possible_recipes = ingredient.recipes.select do |r|
                r.ingredients.all? { |ri| ingredients.include? ri }
            end
        end
        new_possible_recipes
    end

    def rm_ingredients_to_fridge ingredient
        impossible_recipes = []
        if ingredients.include? ingredient
            ingredients.delete(ingredient)
            impossible_recipes = ingredient.recipes
        end
        impossible_recipes
    end

    def all_ingredients_recipes
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
        possible_recipes = candidate_recipes.select { |k, v| v[0] == v[1] }
        possible_recipes.map{|k, v| k}
    end
end
