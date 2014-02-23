module RailroadGraph
  class Graph
    def initialize(txt_graph)
      @graph = { }
      txt_graph.scan(/\w\w\d+/).each do |x|
        start = x[0,1]
        finish = x[1,1]
        @graph[start] ||= { }
        @graph[start][finish] = x[2..-1].to_i
      end
    end

    def to_s
      @graph.to_s
    end
  end
end
