class ShortestPathDijkstra
  def self.shortest(graph, from, to)
    new(graph, from, to).call
  end

  def initialize(graph, from, to)
    @graph = graph
    @from = from
    @to = to
    @lables = lables_constructor
    @visited = []
  end

  def call
    change_point_lables
  end

  private

  def lables_constructor
    data = {}
    @graph.keys.each { |point| data[point] = point == @from ? 0 : Float::INFINITY }
    data
  end

  def change_point_lables
    @graph.keys.each do
      current_lables = Hash[@lables]
      point = current_lables.delete_if { |k, _v| @visited.include? k }.min_by { |_k, v| v }[0]

      edges = @graph[point]
      to_points = edges.keys - @visited
      to_points.each do |edge|
        new_weight = edges[edge] + @lables[point]
        @lables[edge] = new_weight if new_weight < @lables[edge]
      end
      @visited.push point
    end
    p @lables[@to]
    @lables[@to]
  end
end

g = {
  '1' => { '6' => 14, '3' => 9, '2' => 7 },
  '2' => { '1' => 7, '3' => 10, '4' => 15 },
  '3' => { '1' => 9, '2' => 10, '4' => 11, '6' => 2 },
  '4' => { '3' => 11, '5' => 6, '2' => 15 },
  '5' => { '4' => 6, '6' => 9 },
  '6' => { '5' => 9, '1' => 14, '3' => 2 }
}

from = '4'
to = '6'

ShortestPathDijkstra.shortest(g, from, to)
