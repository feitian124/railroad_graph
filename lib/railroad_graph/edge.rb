module RailroadGraph

  class Edge
    attr_accessor :from
    attr_accessor :to
    attr_accessor :length
    attr_accessor :sibling

    def initialize(from, to, length)
      @from = from
      @to = to
      @length = length
      @sibling = nil
    end

    def has_sibling?
      !@sibling.nil?
    end

    def to_s
      "#{from.to_s}#{to.to_s}#{length}"
    end
  end

end
