1. A recipe has mutliple ingredients. recipe_ingredients are optionally with a quantity and a unit
2. Make a list of all possible ingredients
-> from the csv file, get every ingredients list
-> for each item in the ingredients list, get the first word
-> if the first word starts with a decimal,
-> from the first to last decimals of a the first word save that as the quantity (900, 1/2, 0.33)
-> from the last non decimal char of the first word to the first non decimals will be the unit, if the first word is only deciaml, the unit will be "unit", save the quantity as float else as object
-> if the first word doesnt start with decimal then it doenst have a quantity and unit
-> for each recipe_ingredients find or create the ingrediens, add a relation to the recipe, find or create the quantity if string or save as float
3. Make a list of all possible units