# include "json"

require 'rake'
namespace :csvreader do
  task :read => :environment do
    my_array = []
    # line_num=0
    # file=File.open('recipes.json')
    # 9493
    File.readlines('recipes.json').each do |line|
    # text=file.read
    # text=File.open('sample_recipes.json').read
    # text.gsub!(/\r\n?/, "\n")
    # text.each_line do |line|
      # puts line
      begin
        data = JSON.parse(line)
        data["ingredients"].map do |i|
          my_array |= [remove_quantity(i.downcase)]
        end
      rescue
        puts "Could parse #{line}"
      end
    end
    puts my_array
    puts my_array.length
  end
end

def remove_quantity(ingredient)
  ingredient.gsub!(/^\d[^ ]* /, "")
  # ingredient.gsub!(/(de|d') */, "")
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
