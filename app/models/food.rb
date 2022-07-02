class Food < ApplicationRecord
  belongs_to :user
  has_many :food_recipes, dependent: :destroy
  has_many :recipes, through: :food_recipes

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :measurement_unit, presence: true, uniqueness: { case_sensitive: false }
end
