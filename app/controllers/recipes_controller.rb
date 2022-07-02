class RecipesController < ApplicationController
  def index
    @recipes = if current_user.nil?
                 []
               else
                 @current_user.recipes
               end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @food_recipes = FoodRecipe.includes(:food).where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    user = current_user
    recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public))
    recipe.user = user
    respond_to do |format|
      format.html do
        if recipe.save
          flash[:success] = 'Recipe saved successfully'
          redirect_to recipes_url
        else
          flash[:error] = 'Error: recipe could not be saved'
          redirect_to new_recipe_url
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe was deleted successfully.'
    redirect_to recipes_path
  end

  private

  # def set_recipe
  #   @recipe = Recipe.find(params[:id])
  # end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
