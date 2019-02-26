class MinimunNumbersOfCoins
  def self.perform(amount, coins)
    new(amount, coins).call
  end

  def initialize(amount, coins)
    @amount = amount
    @coins = coins
    @result = {}
  end

  def call
    @coins.each do |coin|
      next if coin > @amount
      break if @amount.zero?

      while @amount - coin >= 0
        @amount -= coin
        @result[coin.to_s] = @result[coin.to_s].to_i + 1
      end
    end
    @result
  end
end

coins = [50, 25, 10, 5, 2, 1]

amounts = [77, 8, 99, 23, 50, 2, 26]

amounts.each { |amount| p "#{amount} - #{MinimunNumbersOfCoins.perform(amount, coins)}" }

# output:

# 77 - {"50"=>1, "25"=>1, "2"=>1}
# 8 -  {"5"=>1, "2"=>1, "1"=>1}
# 99 - {"50"=>1, "25"=>1, "10"=>2, "2"=>2}
# 23 - {"10"=>2, "2"=>1, "1"=>1}
# 50 - {"50"=>1}
# 2 -  {"2"=>1}
# 26 - {"25"=>1, "1"=>1}
