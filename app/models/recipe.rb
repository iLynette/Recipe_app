class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes
end
