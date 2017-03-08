require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #index" do
    subject { get :index }
    it_behaves_like 'template rendering action', :index

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
