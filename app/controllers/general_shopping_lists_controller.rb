class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.joins(food_recipes: :recipe).where(['recipes.user_id != ?', current_user.id]).map do
  end
end
