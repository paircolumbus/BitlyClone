require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

	describe "Testing the CREATE action" do
		before(:each) do
			@previous_count = Url.all.count
			post :create, url: { :url => "http://test.com" }
		end

		it "should create a shortened URL" do
			#require 'pry'; binding.pry
			expect(response).to have_http_status(:redirect)
		end

		it "should increase DB item count by one" do
			expect(Url.all.count).to eq( @previous_count + 1 )
		end

		it "should redirect us to index" do
			expect(response.header["Location"]).to match( /\/urls/ )
		end
	end
end
