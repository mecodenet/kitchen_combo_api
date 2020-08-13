Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :fridges
  resources :recipes
  resources :ingredients
  post 'fridges/:id/add/:ingredient_id', to: 'fridges#add_ingredients'
  post 'fridges/:id/rm/:ingredient_id', to: 'fridges#rm_ingredients'
  post 'fridges/:id/random_fill', to: 'fridges#random_fill'
  post 'fridges/:id/add_recipe/:recipe_id', to: 'fridges#add_recipe'
  get 'fridges/:id/recipes', to: 'fridges#recipes'
end
