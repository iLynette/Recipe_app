class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit
      t.integer :price

      t.timestamps
    end
  end
end
