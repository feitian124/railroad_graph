require 'spec_helper'

describe Edge do

  let(:edge) { Edge.new("A", "B", 1) }

  it "should can be created" do
    edge.should be_instance_of Edge
  end

  it "should have nice out put" do
    edge.to_s.should == "A--1--B"
  end
end
