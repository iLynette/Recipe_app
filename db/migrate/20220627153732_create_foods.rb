class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit
      t.integer :price
      t.references :user, index: true, null: false foreign_key: {to_table: :user}

      t.timestamps
    end
  end
end
