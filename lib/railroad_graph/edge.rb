module RailroadGraph

  class Edge
    attr_accessor :from
    attr_accessor :to
    attr_accessor :length

    def initialize(from, to, length)
      @from = from
      @to = to
      @length = length
      @next = nil
    end

    def next(edge)
      @next = edge
      self
    end

    def to_s
      "#{from}--#{length}--#{to}"
    end
  end

end
