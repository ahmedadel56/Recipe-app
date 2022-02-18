class PublicRecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.includes(:recipe_foods, :foods).where(public: true).order('created_at DESC').map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        ingredients_amount: recipe.recipe_foods.count,
        ingredients_price: recipe.foods.map(&:price).sum
      }
    end
  end
end
