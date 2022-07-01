require 'rails_helper'

RSpec.describe "GeneralShoppingLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/general_shopping_lists/index"
      expect(response).to have_http_status(:success)
    end
  end

end
