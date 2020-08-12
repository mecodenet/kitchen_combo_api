class Fridge < ApplicationRecord
    has_many :fridge_ingredients
    has_many :ingredients, through: :fridge_ingredients

    def fill_with_random_ingredients
        40.times do
            ingredients << Ingredient.order(Arel.sql('RANDOM()')).first
        end
        return
    end

    def fill_with_recipe_ingredients recipe
        recipe.ingredients.map do |i|
            add_ingredients_to_fridge i
        end
    end

    def add_ingredients_to_fridge ingredient
        unless ingredients.include? ingredient
            ingredients << ingredient
            possible_recipes = ingredient.recipes.select do |r|
                r.ingredients.all? { |ri| ingredients.include? ri }
            end
            # possible_recipes = ingredient.recipes.map do |r|
            #     puts "r #{r.name}"
            #     puts r.ingredients.all? { |ri| ingredients.include? ri }
            # end
        end

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

        # possible_recipes =[]
        # candidate_recipes.select do |k, v|
        #     if k.ingredients.count == v
        #         possible_recipes << k
        #     end
        # end
        possible_recipes = candidate_recipes.select { |k, v| v[0] == v[1] }

        # puts candidate_recipes.count
        # puts possible_recipes.count
        possible_recipes.map{|k,v| k}
    end
end
