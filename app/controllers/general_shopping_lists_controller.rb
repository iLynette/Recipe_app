class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
      @total_price = 0
      @foods = current_user.foods.includes(:food_recipes).map do |food|
        next if food.food_recipes.empty?

        total_quantity = food.food_recipes.sum(:quantity)
        price = total_quantity * food.price
        @total_price += price

      {
        name: food.name,
        total_quantity:,
        measurement_unit: food.measurement_unit,
        price:
      }
    end.compact

  end
end
