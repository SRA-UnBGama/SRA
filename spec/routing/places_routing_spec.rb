require "spec_helper"

describe PlacesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/places").to route_to("places#index")
    end

    it "routes to #new" do
      expect(:get => "/places/new").to route_to("places#new")
    end

    it "routes to #edit" do
      expect(:get => "/places/1/edit").to route_to("places#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/places").to route_to("places#create")
    end

    it "routes to #update" do
      expect(:put => "/places/1").to route_to("places#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/places/1").to route_to("places#destroy", :id => "1")
    end

  end
end
