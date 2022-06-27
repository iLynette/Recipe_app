require 'rails_helper'

RSpec.describe "food_recipes/new", type: :view do
  before(:each) do
    assign(:food_recipe, FoodRecipe.new(
      quantity: 1
    ))
  end

  it "renders new food_recipe form" do
    render

    assert_select "form[action=?][method=?]", food_recipes_path, "post" do

      assert_select "input[name=?]", "food_recipe[quantity]"
    end
  end
end
