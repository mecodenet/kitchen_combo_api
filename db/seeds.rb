first_recipe = Recipe.create({
    rate: "5",
    author_tip: "",
    budget: "bon marché",
    prep_time: "15 min",
    name: "6 ingrédients que l’on peut ajouter sur une crêpe au Nutella®",
    author: "Nutella",
    difficulty: "très facile",
    people_quantity: "6",
    cook_time: "10 min",
    total_time: "25 min",
    # tags: ["Crêpe", "Crêpes sucrées", "Végétarien", "Dessert"],
    image: "https://assets.afcdn.com/recipe/20171006/72810_w420h344c1cx2544cy1696cxt0cyt0cxb5088cyb3392.jpg",
    nb_comments: "1"
})

my_fridge = Fridge.create({})

["pâte à crêpe", "orange", "banane", "poire pochée", "framboises", "Nutella®", "noisettes torréfiées", "amandes concassées", "orange confites en dés", "noix de coco rapée", "pistache concassées", "amandes effilées"].map do |name|
    ingredient = Ingredient.create(name: name)
    my_fridge.ingredients << ingredient
    first_recipe.ingredients << ingredient
end
