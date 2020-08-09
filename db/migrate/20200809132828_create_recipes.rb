class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.string :cook_time
      t.string :prep_time
      t.string :total_time
      t.string :author
      t.string :nb_comments
      t.string :people_quantity
      t.string :budget
      t.string :difficulty
      t.string :rate
      t.string :author_tip

      t.timestamps
    end
  end
end
