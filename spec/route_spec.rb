require 'spec_helper'

describe Route do

  let(:ab) { Edge.new(Node.new("A"), Node.new("B"), 1) }
  let(:bc) { Edge.new(Node.new("B"), Node.new("C"), 2) }
  let(:route) { Route.new.push(ab).push(bc) }

  it "should can be created" do
    route.should be_instance_of Route
  end

  it "should have nice out put" do
    route.to_s.should include("AB1 BC2")
    route
  end
end
