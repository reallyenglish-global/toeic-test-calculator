module TOEICTestCalculator
  class ScaleScore
    attr_reader :score, :test

    def initialize(score, test)
      @test = test
      @score = score
    end

    def scaled_score
      if score <= test.low_score_threshold
        min_scaled_score
      elsif score >= test.high_score_threshold
        max_scaled_score
      else
        LinearScaleScore.new(
          score,
          low_score_threshold: test.low_score_threshold,
          high_score_threshold: test::high_score_threshold,
          min_scaled_score: min_scaled_score,
          max_scaled_score: max_scaled_score
        ).calculate
      end
    end

    def min_scaled_score
      TOEICTestCalculator::Tests.min_scaled_score
    end

    def max_scaled_score
      TOEICTestCalculator::Tests.max_scaled_score
    end

    def self.for(percentage, test)
      new(percentage, test).scaled_score
    end
  end
end
