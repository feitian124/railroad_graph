module RailroadGraph

  class Graph
    # change the text based graph to hash based which more easy operate
    # example: AB5, BC1,AC3 -> {"A"=>{"B"=>5,"C"=>3}, "B"=>{"C"=>1}
    def initialize(txt_graph)
      @graph = { }
      txt_graph.scan(/\w\w\d+/).each do |x|
        from = x[0,1]
        to = x[1,1]
        @graph[from] ||= { }
        @graph[from][to] = x[2..-1].to_i
      end
    end

    # return the distance when travel through a sequence of towns
    # example: "ABC" -> 6
    def distance(path)
      dist = 0
      path.each_char.map.inject do |prev, cur|
        return nil unless @graph[prev][cur]
        dist += @graph[prev][cur]
        cur
      end
      dist
    end

    def to_s
      @graph.to_s
    end
  end

end
