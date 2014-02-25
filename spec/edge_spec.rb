require 'spec_helper'

describe Edge do

  let(:edge) { Edge.new(Node.new("A"), Node.new("B"), 1) }

  it "should can be created" do
    edge.should be_instance_of Edge
  end

  it "should have nice out put" do
    edge.to_s.should == "AB1"
  end

  it "should have sibling" do
    edge.sibling = Edge.new(Node.new("A"), Node.new("c"), 2)
    edge.sibling.should be_instance_of Edge
  end
end
