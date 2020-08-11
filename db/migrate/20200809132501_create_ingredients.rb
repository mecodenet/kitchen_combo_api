class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end
    add_index :ingredients, :name
    add_index :ingredients, :id
  end
end
