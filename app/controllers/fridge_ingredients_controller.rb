class FridgeIngredientsController < ApplicationController
  before_action :set_fridge_ingredient, only: [:show, :update, :destroy]

  # GET /fridge_ingredients
  def index
    @fridge_ingredients = FridgeIngredient.all

    render json: @fridge_ingredients
  end

  # GET /fridge_ingredients/1
  def show
    render json: @fridge_ingredient
  end

  # POST /fridge_ingredients
  def create
    @fridge_ingredient = FridgeIngredient.new(fridge_ingredient_params)

    if @fridge_ingredient.save
      render json: @fridge_ingredient, status: :created, location: @fridge_ingredient
    else
      render json: @fridge_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fridge_ingredients/1
  def update
    if @fridge_ingredient.update(fridge_ingredient_params)
      render json: @fridge_ingredient
    else
      render json: @fridge_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fridge_ingredients/1
  def destroy
    @fridge_ingredient.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge_ingredient
      @fridge_ingredient = FridgeIngredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fridge_ingredient_params
      params.fetch(:fridge_ingredient, {})
    end
end
