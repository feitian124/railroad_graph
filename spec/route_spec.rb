require 'spec_helper'

describe Route do

  let(:edge) { Edge.new(Node.new("B"), Node.new("C"), 2) }
  let(:route) { Route.new.push(edge) }

  it "should can be created" do
    route.should be_instance_of Route
  end

  it "should have nice out put" do
    route.to_s.should include("BC2")
  end
end
