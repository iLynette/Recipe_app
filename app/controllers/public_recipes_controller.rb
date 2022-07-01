class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user, food_recipes: [:food])where('public = true').order(created_at: :desc)
  end
end
