class CreateFridgeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :fridge_ingredients do |t|

      t.timestamps
    end
  end
end
