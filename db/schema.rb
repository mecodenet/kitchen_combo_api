# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_140353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fridge_ingredients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "fridge_id", null: false
    t.bigint "ingredient_id", null: false
    t.index ["fridge_id"], name: "index_fridge_ingredients_on_fridge_id"
    t.index ["ingredient_id"], name: "index_fridge_ingredients_on_ingredient_id"
  end

  create_table "fridges", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_ingredients_on_id"
    t.index ["name"], name: "index_ingredients_on_name"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "cook_time"
    t.string "prep_time"
    t.string "total_time"
    t.string "author"
    t.string "nb_comments"
    t.string "people_quantity"
    t.string "budget"
    t.string "difficulty"
    t.string "rate"
    t.string "author_tip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_recipes_on_id"
    t.index ["name"], name: "index_recipes_on_name"
  end

  add_foreign_key "fridge_ingredients", "fridges"
  add_foreign_key "fridge_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
end
