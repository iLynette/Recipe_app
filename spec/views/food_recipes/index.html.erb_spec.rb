require 'rails_helper'

RSpec.describe 'food_recipes/index', type: :view do
  before(:each) do
    assign(:food_recipes, [
             FoodRecipe.create!(
               quantity: 2
             ),
             FoodRecipe.create!(
               quantity: 2
             )
           ])
  end

  it 'renders a list of food_recipes' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
