class SelectionSort
  def self.perform(array, sort_type)
    new(array, sort_type).call
  end

  def initialize(array, sort_type)
    @array = array
    @is_asc = sort_type == :acs
  end

  def call
    sorted_array = []
    processed_array = Array.new(@array)
    @array.each do |_element|
      current_smallest = find_smallest_element(processed_array)
      sorted_array.push(current_smallest.first)
      processed_array.delete_at(current_smallest.last)
    end
    sorted_array
  end

  private

  def find_smallest_element(array)
    current_smallest = [array.first, 0]
    array.each_with_index { |element, index| current_smallest = [element, index] if sort_condition(current_smallest.first, element) }
    current_smallest
  end

  def sort_condition(a, b)
    @is_asc ? a > b : a < b
  end
end

sort_types = %i[acs desc]

test_array = [5, 7, 3, 6, 9, 0, 11, 4]

p SelectionSort.perform(test_array, sort_types.first)
p SelectionSort.perform(test_array, sort_types.last)

# output

# [0, 3, 4, 5, 6, 7, 9, 11]
# [11, 9, 7, 6, 5, 4, 3, 0]
