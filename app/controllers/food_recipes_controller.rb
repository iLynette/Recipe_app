class FoodRecipesController < ApplicationController
  before_action :set_food_recipe, only: %i[show destroy]

  def new
    @food_recipe = FoodRecipe.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    food_recipe = FoodRecipe.new(params.require(:food_recipe).permit(:food_id, :quantity))
    food_recipe.recipe = recipe
    respond_to do |format|
      format.html do
        if food_recipe.save
          flash[:success] = 'Ingredient saved successfully'
          redirect_to recipe_url(recipe.id)
        else
          flash[:error] = 'Error: Ingredient could not be saved'
          redirect_to new_recipe_food_recipe_url
        end
      end
    end
  end

  def destroy
    @food_recipe = FoodRecipe.find(params[:id])
    @recipe = food_recipe.recipe
    @food_recipe.destroy
    respond_to do |format|
      format.html { redirect_to food_recipes_url, notice: 'Food recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food_recipe
    @food_recipe = FoodRecipe.find(params[:id])
  end

  def food_recipe_params
    params.require(:food_recipe).permit(:quantity)
  end
end
