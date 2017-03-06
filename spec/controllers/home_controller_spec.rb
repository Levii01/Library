require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    subject { get :index }
    it_behaves_like 'template rendering action', :index
  end
end
