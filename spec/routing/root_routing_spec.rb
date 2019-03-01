require "rails_helper"

RSpec.describe RootController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/").to route_to("root#index")
    end
  end
end
