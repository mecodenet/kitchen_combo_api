class AddIngredientToFridgeIngredients < ActiveRecord::Migration[6.0]
  def change
    add_reference :fridge_ingredients, :ingredient, null: false, foreign_key: true
  end
end
