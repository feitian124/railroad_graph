module RailroadGraph

  class Graph
    # change the text based graph to hash based which more easy to operate
    # example: AB5, BC1,AC3 -> { "A"=>{"B"=>5,"C"=>3 }
    #                          , "B"=>{"C"=>1} }
    def initialize(txt_graph)
      @graph = { }
      txt_graph.scan(/\w\w\d+/).each do |x|
        from = x[0,1]
        to   = x[1,1]
        @graph[from] ||= { }
        @graph[from][to] = x[2..-1].to_i
      end
    end

    def to_s
      @graph.to_s
    end
  end

end
