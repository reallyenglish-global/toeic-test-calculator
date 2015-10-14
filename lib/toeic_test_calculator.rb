module TOEICTestCalculator
  require_relative 'toeic_test_calculator/linear_scale_score'
  require_relative 'toeic_test_calculator/scale_score'
  require_relative 'toeic_test_calculator/score_conversion_chart'
  require_relative 'toeic_test_calculator/scaled_score'
  require_relative 'toeic_test_calculator/tests'

  def self.for(score, test_type)
    test = ['TOEICTestCalculator', 'Tests', test_type].inject(Object) {|o,c| o.const_get c}
    TOEICTestCalculator::ScaleScore.for(score, test)
  end
end
