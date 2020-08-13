require 'swagger_helper'

describe 'Fridge API' do

  path '/fridges/{id}/random_fill' do
    post 'fill the fridge with 40 random ingredients' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          ingrediens: { type: :array }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        run_test!
      end
    end
  end

  path '/fridges/{id}' do
    get 'get the fridge with ingredients' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          # ingrediens: { type: :string }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        run_test!
      end
    end
  end

  path '/fridges/{id}/add/{ingredient_id}' do
    post 'add ingredients in the fridge with ingredients and get new possible recipes in the fridge' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          # ingrediens: { type: :string }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        let(:ingredient_id) { Ingredient.last.id }
        run_test!
      end
    end
  end

  path '/fridges/{id}/rm/{ingredient_id}' do
    post 'remove ingredients in the fridge with ingredients and get all impossible recipes' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          # ingrediens: { type: :string }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        let(:ingredient_id) { Ingredient.last.id }
        run_test!
      end
    end
  end

  path '/fridges/{id}/recipes' do
    get 'get all possible recipes for the fridge' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          # ingrediens: { type: :string }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        let(:ingredient_id) { Ingredient.last.id }
        run_test!
      end
    end
  end

  path '/fridges/{id}/add_recipe/{recipe_id}' do
    post 'add ingredients of recipe to fridge and get fridge an ingredients in response' do
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', '' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          # ingrediens: { type: :string }
        },
        required: [ 'id', 'ingredients']
         # returns fridge with 40 ingredients

        let(:id) { Fridge.create().id }
        let(:recipe_id) { Recipe.last.id }
        run_test!
      end
    end
  end

end
