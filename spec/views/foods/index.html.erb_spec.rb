require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    assign(:foods, [
             Food.create!(
               name: 'Name',
               measurement_unit: 2,
               price: 3
             ),
             Food.create!(
               name: 'Name',
               measurement_unit: 2,
               price: 3
             )
           ])
  end

  it 'renders a list of foods' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
