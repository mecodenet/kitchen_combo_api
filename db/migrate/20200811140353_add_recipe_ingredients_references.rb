class AddRecipeIngredientsReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipe_ingredients, :ingredient, null: false, foreign_key: true
    add_reference :recipe_ingredients, :recipe, null: false, foreign_key: true
  end
end
