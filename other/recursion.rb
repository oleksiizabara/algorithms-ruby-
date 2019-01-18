class Factorial
  def self.perform(number)
    new.factorial(number)
  end

  def factorial(number)
    (0..1).cover?(number) ? 1 : number * factorial(number - 1)
  end
end

numbers = [0, 1, 2, 3, 4, 5, 6]
numbers.each { |number| p "#{number}! =  #{Factorial.perform(number)}" }

# output:

# 0! =  1
# 1! =  1
# 2! =  2
# 3! =  6
# 4! =  24
# 5! =  120
# 6! =  720