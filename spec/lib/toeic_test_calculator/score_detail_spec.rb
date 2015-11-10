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
              scaled_score: 190
            }, 
            {
              category: 'listening', 
              score: 20, 
              max_score: 50, 
              scaled_score: 190
            }
          ], 
          total: {
            scaled_score: 380, 
            band: "350-395"
          }
        } 
      )
    end
  end
end
