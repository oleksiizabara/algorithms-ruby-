# In the protected area there is a list of objects and a list of lamps.
# Each lamp illuminates one or more protected objects or none of them.

# You need to find out the minimum number of lanterns to illuminate all objects.

class CoverAll
  def self.perform(points, illuminates_info)
    new(points, illuminates_info).call
  end

  def initialize(points, illuminates_info)
    @points = points
    @illuminates_info = illuminates_info
    @processed_points = []
    @processed_illuminates = []
  end

  def call
    select_illuminate_with_max_covered_points! until @points.empty?
    @processed_illuminates
  end

  def select_illuminate_with_max_covered_points!
    data = @illuminates_info.max_by { |_k, v| (v - @processed_points).count }
    @illuminates_info.delete(data.first)
    @processed_illuminates.push data.first
    @processed_points += data.last
    @points -= data.last
    raise StandardError, 'insufficient number of lamps' if !@points.empty? && @illuminates_info.empty?
  end
end

points = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

illuminates_info = {
  a: [1, 3, 11],
  b: [1, 3, 2, 5, 4, 6],
  c: [5, 6],
  d: [11, 3, 10],
  e: [3, 4, 6, 8, 9, 10],
  f: [6, 7, 8]
}

p CoverAll.perform(points, illuminates_info)
