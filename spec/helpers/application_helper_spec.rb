require "spec_helper"

describe ApplicationHelper do
  describe ".zone_name_for" do
    it "returns the correct zone name 'Zona Norte' for each zone" do
      helper.zone_name_for(:north).should == "Zona Norte"
      helper.zone_name_for(:east).should == "Zona Leste"
      helper.zone_name_for(:south).should == "Zona Sul"
      helper.zone_name_for(:west).should == "Zona Oeste"
      helper.zone_name_for(:downtown).should == "Centro"
    end
  end
end