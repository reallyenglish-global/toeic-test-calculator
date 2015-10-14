require 'spec_helper'

describe TOEICTestCalculator::ScaledScore do
  describe '#new' do
    describe 'score' do
      it 'is rounded to the nearest 5' do
        roundings = [
          [7.44444444.to_r, 5],
          [12.44444444.to_r, 10],
          [12.5.to_r, 15],
          [17.4.to_r, 15]
        ]

        roundings.each do |rational, score|
          expect(described_class.new(rational).score).to eq(score)
        end
      end
    end
  end
end

