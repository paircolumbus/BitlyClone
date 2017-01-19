require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET bitly_path" do
    it "returns http success" do
      get :bitly_path
      expect(response).to have_http_status(:success)
    end
  end

end
