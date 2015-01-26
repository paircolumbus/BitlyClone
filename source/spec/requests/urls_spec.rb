require 'rails_helper'

RSpec.describe "Urls", :type => :request do
  describe "GET /urls" do
    it "works! (now write some real specs)" do
      get urls_path
      expect(response).to have_http_status(200)
    end
  end
end
