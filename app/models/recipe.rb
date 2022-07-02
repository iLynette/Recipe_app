class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :foods, through: :food_recipes

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
end
