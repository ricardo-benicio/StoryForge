require "rails_helper"

RSpec.describe AssemblyPartsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/assembly_parts").to route_to("assembly_parts#index")
    end

    it "routes to #new" do
      expect(get: "/assembly_parts/new").to route_to("assembly_parts#new")
    end

    it "routes to #show" do
      expect(get: "/assembly_parts/1").to route_to("assembly_parts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/assembly_parts/1/edit").to route_to("assembly_parts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/assembly_parts").to route_to("assembly_parts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/assembly_parts/1").to route_to("assembly_parts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/assembly_parts/1").to route_to("assembly_parts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/assembly_parts/1").to route_to("assembly_parts#destroy", id: "1")
    end
  end
end
