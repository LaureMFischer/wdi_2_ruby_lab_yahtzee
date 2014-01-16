require 'spec_helper'
require_relative '../scoring'

describe YahtzeeRoll do
  let(:new_roll){YahtzeeRoll.new(2, 4, 5, 1, 6)}
  let(:new_roll2){YahtzeeRoll.new(2, 1, 6, 2, 6)}

  describe '#initialize' do
    it 'creates a new roll with a value for each of five dice' do
      expect(new_roll.dice).to eq [2, 4, 5, 1, 6]
    end

    it 'raises an error if any of the die have an invalid value' do
      expect{ YahtzeeRoll.new(7, 4, 5, 1, 6)}.to raise_error
      expect{ YahtzeeRoll.new(1, -1, 5, 1, 6)}.to raise_error
      expect{ YahtzeeRoll.new(3, 4, 8, 1, 6)}.to raise_error
      expect{ YahtzeeRoll.new(4, 4, 5, 9, 6)}.to raise_error
      expect{ YahtzeeRoll.new(5, 4, 5, 1, -1)}.to raise_error
    end
  end

  describe '#score_roll' do
    it 'sums the numbers corresponding to the categories ones, twos, threes, fours, fives and sixes' do
      expect(new_roll.score_roll(:ones)).to eq 1
      expect(new_roll.score_roll(:twos)).to eq 2
      expect(new_roll.score_roll(:threes)).to eq 0
      expect(new_roll.score_roll(:fours)).to eq 4
      expect(new_roll.score_roll(:fives)).to eq 5
      expect(new_roll.score_roll(:sixes)).to eq 6
    end

    it 'sums the highest pair if category "pair" is chosen' do
      expect(new_roll2.score_roll(:pair)).to eq 12
    end


  end
end
