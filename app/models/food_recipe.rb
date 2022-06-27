class FoodRecipe < ApplicationRecord
    belong_to :recipe
    belong_to :food
end
