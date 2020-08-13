class CreateJoinTableFridgesRecipes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :fridges, :recipes do |t|
      t.index [:fridge_id, :recipe_id]
      t.index [:recipe_id, :fridge_id]
    end
  end
end
