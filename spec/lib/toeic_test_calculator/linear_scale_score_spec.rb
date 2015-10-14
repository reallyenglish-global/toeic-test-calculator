require 'spec_helper'
describe TOEICTestCalculator::LinearScaleScore do
  subject { described_class.new(percent, opts) }

  describe '.calculate' do
    let(:opts) {{
      low_score_threshold: 3,
      high_score_threshold: 7,
      min_scaled_score: 1,
      max_scaled_score: 21,
    }}

    it 'raises an error if score is outside the range' do
      expect{
        described_class.new(1, opts).calculate
      }.to raise_error TOEICTestCalculator::LinearScaleScore::OutsideRangeError

      expect{
        described_class.new(8, opts).calculate
      }.to raise_error TOEICTestCalculator::LinearScaleScore::OutsideRangeError
    end

    it 'returns the correct score for percentages within range' do
      expect(
        described_class.new(3, opts).calculate
      ).to eq(1)

      expect(
        described_class.new(4, opts).calculate
      ).to eq(6)

      expect(
        described_class.new(5, opts).calculate
      ).to eq(11)

      expect(
        described_class.new(6, opts).calculate
      ).to eq(16)

      expect(
        described_class.new(7, opts).calculate
      ).to eq(21)
    end
  end
end


