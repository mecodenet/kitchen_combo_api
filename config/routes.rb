Rails.application.routes.draw do
  resources :fridge_ingredients
  resources :fridges
  resources :recipe_ingredients
  resources :recipes
  resources :ingredients
  get 'fridges/:id/add/:ingredient_id', to: 'fridges#add_ingredients'
  get 'fridges/:id/rm/:ingredient_id', to: 'fridges#rm_ingredients'
  get 'fridges/:id/random_fill', to: 'fridges#random_fill'
  get 'fridges/:id/add_recipe/:recipe_id', to: 'fridges#add_recipe'
  get 'fridges/:id/recipes', to: 'fridges#recipes'
end
