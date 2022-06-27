require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        name: "Name",
        preparation_time: 2,
        cooking_time: 3,
        description: "Description",
        public: false
      ),
      Recipe.create!(
        name: "Name",
        preparation_time: 2,
        cooking_time: 3,
        description: "Description",
        public: false
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
