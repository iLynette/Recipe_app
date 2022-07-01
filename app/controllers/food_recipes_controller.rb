class FoodRecipesController < ApplicationController
  def new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    food_recipe = FoodRecipe.new(params.require(:recipe_food).permit(:food_id, :quantity))
    food_recipe.recipe = @recipe
    respond_to do |format|
      format.html do
        if food_recipe.save
          flash[:success] = 'Ingredient saved successfully'
          redirect_to recipe_url(@recipe.id)
        else
          flash[:error] = 'Error: Ingredient could not be saved'
          redirect_to new_recipe_food_recipe_url
        end
      end
    end
  end

  def destroy
    @food_recipe = FoodRecipe.find(params[:id])
    @recipe = @food_recipe.recipe
    @food_recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipe_url(@recipe), notice: 'Food recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def food_recipe_params
    params.require(:food_recipe).permit(:quantity)
  end
end
