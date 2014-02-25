require 'spec_helper'

describe Route do

  let(:route) { Route.new([Edge.new("A","B",1)]) }

  it "should can be created" do
    route.should be_instance_of Route
  end

  it "should have nice out put" do
    route.to_s.should include("AB1")
    route.push(Edge.new("B","C",2)).to_s.should include("AB1 BC2")
  end

  it "should get the right distance" do
    route.distance.should == 1
  end

  it "should can push edge" do
    route.push(Edge.new("B", "C", 2)).distance.should == 3
  end
end
