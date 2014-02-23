require 'spec_helper'

describe Graph do

  let(:graph) { Graph.new("AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7") }

  it "should can be created" do
    graph.should be_instance_of Graph
  end

  it "should have nice out put" do
    graph.to_s.should include("{", "=>", "}")
  end

  it "should get the right distance" do
    graph.distance("").should == 0
    graph.distance("A").should == 0
    graph.distance("AB").should == 5
    graph.distance("ABC").should == 9
    graph.distance("ABCD").should == 17
    graph.distance("ABCE").should == 11
  end
end
