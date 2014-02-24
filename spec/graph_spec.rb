require 'spec_helper'

describe Graph do

  let(:graph) { Graph.new("AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7") }

  it "should can be created" do
    graph.should be_instance_of Graph
  end

  it "should have nice out put" do
    graph.to_s.should include("{", "=>", "}")
  end

end
