require 'spec_helper'

describe TOEICTestCalculator do
  describe 'Listening test score.' do
    describe 'when percentage score is minimum threshold' do
      it 'returns score of 5' do
        (1..17).each do |percentage|
          expect(described_class.for(percentage, 'listening')).to be 5
        end
      end
    end

    describe 'percentage score is 93 or higher' do
      it 'returns score of 495' do
        (93..100).each do |percentage|
          expect(described_class.for(percentage, 'listening')).to be 495
        end
      end
    end
  end

  describe 'Reading test score' do
    describe 'percentage score is less than 21' do
      it 'returns score of 5' do
        (1..21).each do |percentage|
          expect(described_class.for(percentage, 'reading')).to be 5
        end
      end
    end

    describe 'percentage score is 100' do
      it 'returns score of 495' do
        expect(described_class.for(100, 'reading')).to be 495
      end
    end

    describe 'percentage score is < 100' do
      it 'returns score of 495' do
        expect(described_class.for(99, 'reading')).to be < 495
      end
    end
  end

  describe '::ScoreProfile' do
    it 'produces csv' do
      puts 'LISTENING'
      puts described_class::ScoreConversionChart.csv('listening')
    end
    it 'produces csv' do
      puts 'READING'
      puts described_class::ScoreConversionChart.csv('reading')
    end
  end
end
