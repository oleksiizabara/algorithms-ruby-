class BinarySearch
  def self.perform(list, element)
    new(list, element).call
  end

  def initialize(list, element)
    @list = list
    @element = element
  end

  def call
    min_index = 0
    max_index = @list.count - 1
    while min_index <= max_index
      middle_index = (min_index + max_index) / 2
      middle_element = @list[middle_index]
      if middle_element == @element
        return middle_index
      elsif middle_element > @element
        max_index = middle_index - 1
      else
        min_index = middle_index + 1
      end
    end
    "#{@element} is not found"
  end
end

test_list = [1, 4, 6, 8, 22, 56, 178] # sorted array only
test_element = 22
p BinarySearch.perform(test_list, test_element)
