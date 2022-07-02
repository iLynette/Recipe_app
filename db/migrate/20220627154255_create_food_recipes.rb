class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
      t.integer :quantity
      t.references :recipe, index: true, null: false, foreign_key: {to_table: :recipes}
      t.references :food, index: true, null: false, foreign_key: {to_table: :foods}

      t.timestamps
    end
  end
end
