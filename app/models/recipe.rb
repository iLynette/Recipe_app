class Recipe < ApplicationRecord
  belong_to :user
  has_many :food_recipe
end
