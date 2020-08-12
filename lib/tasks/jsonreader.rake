# include "json"

require 'rake'
namespace :jsonreader do
  task :read => :environment do
    my_hash = {}
    File.readlines('recipes.json').map.with_index do |line, index|
      puts "#{index}"
      data = JSON.parse(line)
      recipe = Recipe.create({name: data["name"], rate: data["rate"], author_tip: data["author_tip"],
        budget: data["budget"], prep_time: data["prep_time"], author: data["author"],
        total_time: data["budget"], image: data["prep_time"], nb_comments: data["nb_comments"],
        difficulty: data["difficulty"], people_quantity: data["people_quantity"], cook_time: data["cook_time"] })

      data["ingredients"].map do |i|
        clean_str = remove_quantity(i.downcase)
        if my_hash.has_key?(clean_str)
          # puts "FOUND #{clean_str}       FOR  #{recipe.name}"
          recipe.ingredients << Ingredient.find(my_hash[clean_str])
        else
          # puts "not found #{clean_str}        FOR  #{recipe.name}"
          obj = Ingredient.create({ name: clean_str })
          my_hash[clean_str] = obj.id
          recipe.ingredients << obj
        end
      end
    end
    # puts my_hash
    # puts my_hash.length
  end
end

def remove_quantity(ingredient)
  ingredient.gsub!(/^\d[^ ]* /, "")
  ingredient.gsub!(/^à soupe /, "")
  ingredient.gsub!(/^à café rase /, "")
  ingredient.gsub!(/^poignée /, "")
  ingredient.gsub!(/^à café /, "")
  ingredient.gsub!(/^ *(de |d')/, "")
  ingredient.gsub!(/ *,$/, "")
  ingredient.gsub!(/ .$/, "")
  ingredient.gsub!(/ ..$/, "")
  ingredient
end
