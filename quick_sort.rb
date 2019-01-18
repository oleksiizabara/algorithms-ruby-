class QuickSort
  def self.perform(array)
    new.quick_sort(array)
  end

  def quick_sort(array)
    part_of(array, false) + part_of(array, true)
  end

  def part_of(array, is_more)
    a = []
    equals = []
    f = array.first
    array.each do |element|
      a.push(element) if is_more ? element > f : element < f
      equals.push(element) if element == f
    end
    a.count <= 2 ? (is_more ? simple_sort(a) : simple_sort(a) + equals) : (is_more ? quick_sort(a) : quick_sort(a + equals))
  end

  def simple_sort(array)
    array.empty? || array.count == 1 ? array : (array.first <= array.last ? array : [array.last, array.first])
  end
end

test_array = [44, 7, 2, 33, 5, 9, 0, 77, 77, -5, -5, 44, 0, 1, 35, 12, 88, 35, 1, -2, 11, 3, 4, 2, 220]

p QuickSort.perform(test_array)

# output

# [-5, -5, -2, 0, 0, 1, 1, 2, 2, 3, 4, 5, 7, 9, 11, 12, 33, 35, 35, 44, 44, 77, 77, 88, 220]