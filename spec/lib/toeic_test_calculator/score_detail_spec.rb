require 'spec_helper'
describe TOEICTestCalculator::ScoreDetail do
  let(:score_detail) {
    {
       scores: [
        {
          category: 'reading',
          score: 20,
          max_score: 50,
        },
        {
          category: 'listening',
          score: 20,
          max_score: 50,
        }
       ]
    }
  }

  describe '.hash' do
    it 'embellishes detail with toeic scores' do
      expect(described_class.hash(score_detail)).to eq(
        {
          scores: [
            {
              category: 'reading', 
              score: 20, 
              max_score: 50, 
              scaled_score: 125
            }, 
            {
              category: 'listening', 
              score: 20, 
              max_score: 50, 
              scaled_score: 155
            }
          ], 
          total: {
            scaled_score: 280, 
            band: "240-315"
          }
        } 
      )
    end
  end
end
