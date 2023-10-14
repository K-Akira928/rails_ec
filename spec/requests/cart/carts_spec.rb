require 'rails_helper'

RSpec.describe "Cart::Carts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/cart/carts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
