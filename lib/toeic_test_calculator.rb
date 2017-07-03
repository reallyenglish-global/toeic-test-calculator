module TOEICTestCalculator
  require_relative 'toeic_test_calculator/linear_scale_score'
  require_relative 'toeic_test_calculator/scale_score'
  require_relative 'toeic_test_calculator/score_conversion_chart'
  require_relative 'toeic_test_calculator/scaled_score'
  require_relative 'toeic_test_calculator/score_detail'
  require_relative 'toeic_test_calculator/tests'

  def self.for(score, test_type)
    test_name = [
      'TOEICTestCalculator',
      'Tests',
      test_type.split('_').map(&:capitalize).join
    ]
    test = test_name.inject(Object) {|o,c| o.const_get c}
    score_rational = TOEICTestCalculator::ScaleScore.for(score, test)
    TOEICTestCalculator::ScaledScore.new(score_rational).score
  end

  def self.score_table
    scores = []
    (0..50).each do |listening_score|
      (0..50).each do |reading_score|
        score={scores:[{category:"listening",score:listening_score,max_score:50},{category:"reading",score:reading_score,max_score:50}]}
        score_detail = TOEICTestCalculator::ScoreDetail.hash(score)
        scores << score_detail
      end
    end
    scores
  end
end
