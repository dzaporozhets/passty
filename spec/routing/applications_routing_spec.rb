require "spec_helper"

describe ApplicationsController do
  describe "routing" do

    it "routes to #index" do
      get("/applications").should route_to("applications#index")
    end

    it "routes to #new" do
      get("/applications/new").should route_to("applications#new")
    end

    it "routes to #show" do
      get("/applications/1").should route_to("applications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/applications/1/edit").should route_to("applications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/applications").should route_to("applications#create")
    end

    it "routes to #update" do
      put("/applications/1").should route_to("applications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/applications/1").should route_to("applications#destroy", :id => "1")
    end

  end
end
