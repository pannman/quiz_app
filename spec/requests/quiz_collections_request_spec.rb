require 'rails_helper'

RSpec.describe "QuizCollections", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/quiz_collections/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/quiz_collections/index"
      expect(response).to have_http_status(:success)
    end
  end

end
