class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public
      t.references :user, index: true, null: false foreign_key: {to_table: :user}

      t.timestamps
    end
  end
end
