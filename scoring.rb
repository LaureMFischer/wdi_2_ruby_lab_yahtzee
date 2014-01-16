require 'pry'

class YahtzeeRoll
  attr_accessor :dice :value_counts
  def initialize(*dice)
    dice.each do |die|
      raise "Please enter only numbers 1 through 6" unless (1..6).include? die
    end
    @dice = dice

    @value_counts = { ones: 0, twos: 0, threes: 0, fours: 0, fives: 0, six: 0 }
    value_counts[:ones] += 1 if die == 1

  end

  def score_roll(category)
    cat1_6 = [:ones, :twos, :threes, :fours, :fives, :sixes]
    sum = 0

    if cat1_6.include?(category)
      @dice.each { |die| sum += die if die == cat1_6.index(category) + 1}

    elsif category == :pair
      @dice.sort
      @dice.

    end


    return sum
  end

end
