require 'spec_helper'

describe Node do

  let(:node) { Node.new("A") }
  let(:a) { Node.new("A") }

  it "should can be created" do
    node.should be_instance_of Node
  end

  it "should can be compare" do
      Node.new("A").should == Node.new("A")
      Node.new("A").should_not == Node.new("B")
      Node.new("A").should eql(Node.new("A"))
      Node.new("A").should_not eql(Node.new("B"))
  end

  it "should work as hash key" do
      puts a
      puts node
      h = {}
      ob = Object.new
      h[a] = ob
      h.has_key?(node).should be_true
      h[a].should == ob
  end
end
