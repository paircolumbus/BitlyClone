require "rails_helper"

RSpec.describe LinksController, type: :routing do
  describe "routing" do

    xit "routes to #index" do
      expect(:get => "/links").to route_to("links#index")
    end

    xit "routes to #new" do
      expect(:get => "/links/new").to route_to("links#new")
    end

    xit "routes to #show" do
      expect(:get => "/links/1").to route_to("links#show", :id => "1")
    end

    xit "routes to #edit" do
      expect(:get => "/links/1/edit").to route_to("links#edit", :id => "1")
    end

    xit "routes to #create" do
      expect(:post => "/links").to route_to("links#create")
    end

    xit "routes to #update via PUT" do
      expect(:put => "/links/1").to route_to("links#update", :id => "1")
    end

    xit "routes to #update via PATCH" do
      expect(:patch => "/links/1").to route_to("links#update", :id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/links/1").to route_to("links#destroy", :id => "1")
    end

  end
end
