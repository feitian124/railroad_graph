module RailroadGraph

  class Graph
    # change the text based graph to hash based which more easy to operate
    # the node is as key, one direct connected edge as value, and all other direct connected edges
    # are as the edge's siblings.
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

    #search graph find if there are edge between two nodes
    #def has_edge_between?(a, b)
    #  return false unless has_node?(a) && has_node?(b)
    #  curr_edge = @graph[a]
    #  loop do
    #    return true if curr_edge.to == b
    #    curr_edge = curr_edge.sibling
    #    break unless curr_edge.has_sibling?
    #  end 
    #  false
    #end

    # get distance between the 2 directly connected nodes
    def distance_between(a, b)
      raise "NO SUCH ROUTE" unless has_node?(a) && has_node?(b)
      curr_edge = @graph[a]
      loop do
        return curr_edge.length if curr_edge.to == b
        curr_edge = curr_edge.sibling
        break unless curr_edge.has_sibling?
      end 
      raise "NO SUCH ROUTE"
    end

    # get the distance when travel through a sequence of nodes
    def distance(nodes)
      return 0 if nodes.size < 2
      len = 0
      nodes.each.reduce do |memo, item|
        len += distance_between(memo, item)
        memo = item
      end
      return len  
    end

    def find_routes(from, to, depth, limit)
      raise "NO SUCH ROUTE" unless has_node?(from) && has_node?(to)
      # the routes of current recursive stack level, the graph's routes
      # is determined by the minimum recursive stack levels
      routes = 0
      depth += 1
      return 0 if depth > limit
      from.visited = true
      curr_edge = @graph[from]
      while curr_edge
        # If destination matches increment route count, then continue to next node at same depth
        if curr_edge.to == to
          routes += 1
          curr_edge = curr_edge.sibling
          continue
        # If destination does not match and has not yet been visited, 
        # we recursively traverse destination node 
        elsif !curr_edge.to.visited
          routes += find_routes(edge.to, to, depth, limit);
          depth--;
        end
        curr_edge = curr_edge.sibling
      end
      # mark the start node as visited as sibling need traverse also 
      from.visited = false
      routes
    end

    # get all nodes of the graph
    def nodes
      @graph.keys
    end

    def has_node?(node)
      @graph.has_key? node
    end

    def to_s
      result=""
      @graph.each do |k, v|
        row = "#{k}-[#{v}"
        while v.has_sibling?
          v = v.sibling
          row += " #{v}"
        end
        row += "]\n"
        result += row
      end
      result
    end
  end

end
