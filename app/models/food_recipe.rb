class FoodRecipe < ApplicationRecord
  belongs_to :recipes
  belongs_to :foods

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
