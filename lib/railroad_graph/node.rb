module RailroadGraph

  class Node
    attr_accessor :name
    attr_accessor :visited

    def initialize(name)
      @name = name
      @visited = false
    end

    def ==(other)
      @name == other.name #&& @visited == other.visited
    end

    def eql?(other)
       self == other
    end

    def hash
      @name.hash #^ @visited.hash
    end

    def to_s
      @name
    end

    def to_str
      to_s
    end
  end
end
