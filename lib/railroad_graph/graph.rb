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

    def first_edge(node)
      @graph[node]
    end

    #search graph find if there are edge between two nodes
    def has_edge_between?(a, b)
      return false unless has_node?(a) && has_node?(b)
      curr_edge = @graph[a]
      while curr_edge
        return true if curr_edge.to == b
        curr_edge = curr_edge.sibling
      end
      false
    end

    # get distance between the 2 directly connected nodes
    def distance_between(a, b)
      raise "NO SUCH ROUTE" unless has_node?(a) && has_node?(b)
      curr_edge = @graph[a]
      while curr_edge
        return curr_edge.length if curr_edge.to == b
        curr_edge = curr_edge.sibling
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

    # use Depth-First-Search to find all routes
    def find_routes(from, to, depth, limit)
      raise "NO SUCH ROUTE" unless has_node?(from) && has_node?(to)
      # If start node exists then traverse all possible
      # routes and for each, check if it is destination
      routes = 0
      depth += 1
      return 0 if depth > limit
      from.visited = true
      curr_edge = first_edge(from)
      route = Route.new unless route
      while curr_edge #for all siblings
        if curr_edge.to == to #find the route
          routes += 1
          curr_edge = curr_edge.sibling
          next
        elsif !curr_edge.to.visited
          routes += find_routes(curr_edge.to, to, depth, limit)
          depth -= 1
        end
        curr_edge = curr_edge.sibling
      end
      # mark the start node as visited as sibling need traverse also
      from.visited = false
      return routes
    end

    def shortest_route(from, to, weight, shortest)
      raise "NO SUCH ROUTE" unless has_node?(from) && has_node?(to)
      from.visited = true
      curr_edge = first_edge(from)
      while curr_edge #for all siblings
        if curr_edge.to == to || !curr_edge.to.visited
          weight += curr_edge.length
        end
        if curr_edge.to == to
          shortest = weight if shortest == 0 || weight < shortest
          from.visited = false
          return shortest
        elsif !curr_edge.to.visited
          shortest = shortest_route(curr_edge.to, to, weight, shortest)
          weight -= curr_edge.length
        end
        curr_edge = curr_edge.sibling
      end
      # mark the start node as visited as sibling need traverse also
      from.visited = false
      return shortest
    end

    def routes_within_stops(from, to, weight, max)
      raise "NO SUCH ROUTE" unless has_node?(from) && has_node?(to)
      routes = 0
      curr_edge = first_edge(from)
      while curr_edge #for all siblings
          weight += curr_edge.length
        if weight < max
          if curr_edge.to == to
            routes += 1
            routes += routes_within_stops(curr_edge.to, to, weight, max)
            curr_edge = curr_edge.sibling
            next
          else
            routes += routes_within_stops(curr_edge.to, to, weight, max)
            weight -= curr_edge.length
          end
        else
          weight -= curr_edge.length
        end
        curr_edge = curr_edge.sibling
      end
      return routes
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
