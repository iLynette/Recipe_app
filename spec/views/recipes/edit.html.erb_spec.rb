require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
                                name: 'MyString',
                                preparation_time: 1,
                                cooking_time: 1,
                                description: 'MyString',
                                public: false
                              ))
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(@recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time]'

      assert_select 'input[name=?]', 'recipe[cooking_time]'

      assert_select 'input[name=?]', 'recipe[description]'

      assert_select 'input[name=?]', 'recipe[public]'
    end
  end
end
