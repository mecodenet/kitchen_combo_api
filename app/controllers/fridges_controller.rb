class FridgesController < ApplicationController
  before_action :set_fridge, only: [:show, :update, :destroy, :random_fill, :add_ingredients, :rm_ingredients, :recipes, :add_recipe]

  # GET /fridges
  def index
    @fridges = Fridge.all

    render json: @fridges
  end

  # GET /fridges/1
  def show
    render json: @fridge.as_json({ include: :ingredients })
  end

  # GET /fridges/1/random
  def random_fill
    @fridge.fill_with_random_ingredients
    render json: @fridge.as_json({ include: :ingredients })
  end

  # GET /fridges/1/add/:ingredient_id
  def add_ingredients
    render json: @fridge.add_ingredients_to_fridge(Ingredient.find(params[:ingredient_id]))
  end

  # GET /fridges/1/rm/:ingredient_id
  def rm_ingredients
    # render json: @fridge.rm_ingredients_to_fridge(Ingredient.find(params[:ingredient_id]))
    render json: @fridge.rm_ingredients_to_fridge(Ingredient.find(params[:ingredient_id]))
  end

  # GET /fridges/1/recipes/
  def recipes
    render json: @fridge.all_ingredients_recipes
  end

  # GET /fridges/1/add_recipe/:recipe_id
  def add_recipe
    @fridge.fill_with_recipe_ingredients(Recipe.find(params[:recipe_id]))
    render json: @fridge.as_json({ include: :ingredients })
  end

  # POST /fridges
  def create
    @fridge = Fridge.new(fridge_params)

    if @fridge.save
      render json: @fridge, status: :created, location: @fridge
    else
      render json: @fridge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fridges/1
  def update
    if @fridge.update(fridge_params)
      render json: @fridge
    else
      render json: @fridge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fridges/1
  def destroy
    @fridge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge
      @fridge = Fridge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fridge_params
      params.fetch(:fridge, {})
    end
end
