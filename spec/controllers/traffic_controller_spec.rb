require "spec_helper"

describe TrafficController do
  describe "GET index.json" do
    it "returns the info in JSON" do
      Traffic::Scraper.should_receive(:overall_traffic).and_return(15)
      Traffic::Scraper.should_receive(:zone_traffic).and_return({
        north: 1,
        south: 2,
        east: 3,
        west: 4,
        downtown: 5
      })

      get :index, format: :json

      parsed_response = JSON.parse(response.body)
      parsed_response.should == {
        "total" => 15,
        "zonas" => {
          "norte" => 1,
          "sul" => 2,
          "leste" => 3,
          "oeste" => 4,
          "centro" => 5
        }
      }
    end
  end
end