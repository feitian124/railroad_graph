module RailroadGraph

  class Graph
    # change the text based graph to hash based which more easy to operate
    def initialize(txt_graph)
      @graph = { }
      txt_graph.scan(/\w\w\d+/).each do |x|
        from   = Node.new(x[0,1])
        to     = Node.new(x[1,1])
        length = x[2..-1].to_i
        edge   = Edge.new(from, to, length)

        if @graph.has_key? from
          curr_edge =  @graph[from]
          while curr_edge.has_sibling?
            curr_edge = curr_edge.sibling
          end
          curr_edge.sibling = edge
        else
          @graph[from] = edge
        end
      end
    end

   # def to_s
   #   result=""
   #   @graph.each do |k, v|
   #     row ="#{k}-["
   #     row += "#{v.to_s}"
   #     tmp = v
   #     while tmp.has_sibling?
   #       tmp = tmp.sibling
   #       row += " #{tmp.to_s}"
   #     end
   #     row += "]\n"
   #     result += row
   #   end
   #   result
   # end
  end

end
