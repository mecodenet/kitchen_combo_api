class Ingredient < ApplicationRecord
    has_one :fridge_ingredient
    has_one :fridge, through: :fridge_ingredient
    has_many :recipe_ingredient
    has_many :recipe, through: :recipe_ingredient
end
