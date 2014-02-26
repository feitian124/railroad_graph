require 'spec_helper'

describe Graph do

  let(:a) { Node.new("A") }
  let(:b) { Node.new("B") }
  let(:c) { Node.new("C") }
  let(:d) { Node.new("D") }
  let(:e) { Node.new("E") }
  let(:f) { Node.new("F") }
  let(:graph) { Graph.new("AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7") }

  it "should can be created" do
    graph.should be_instance_of Graph
    graph.nodes.should include(a, b, c, d, e)
    graph.nodes.should_not include(f)
  end

  it "should have nice out put" do
    graph.to_s.should include("[", "]")
    puts graph
  end

  it "can get distance between 2 nodes" do
    graph.distance_between(a, b).should == 5
    graph.distance_between(d, c).should == 8
    expect{ graph.distance_between(a, c) }.to raise_error(StandardError, 'NO SUCH ROUTE')
  end

  it "can get distance for given nodes" do
    graph.distance([a, b, c]).should == 9
    graph.distance([b, c, d]).should == 12
    expect{ graph.distance([a, b, d]) }.to raise_error(StandardError, 'NO SUCH ROUTE')
  end
end
