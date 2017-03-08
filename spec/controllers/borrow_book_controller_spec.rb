require 'rails_helper'

RSpec.describe UserBooksController, type: :controller do

  describe "GET #rent" do
    it "returns http success" do
      get :rent
      expect(response).to have_http_status(:success)
    end
  end

end
