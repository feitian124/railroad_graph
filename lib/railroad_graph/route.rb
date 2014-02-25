module RailroadGraph

  # route is a sequence of edges
  class Route
    def initialize(route)
      @route = []
      @route += route
    end

    # return the distance when travel through a sequence of towns
    def distance
      dist = 0
      @route.each do |edge|
        dist += edge.length
      end
      dist
    end

    def push (edge)
      raise "argument should be Edge" unless edge.instance_of? Edge
      @route.push edge
      self
    end

    def check!(route)
      raise 'route string should only have uppercase letter and at least 2 letters' unless /^[A-Z]{2,}$/ =~ route
      true
    end

    def to_s
      result = ""
      @route.each do |edge|
        if result.length == 0
          result = edge.to_s
        else
          result = result + " " + edge.to_s
        end
      end
      result
    end
  end

end
