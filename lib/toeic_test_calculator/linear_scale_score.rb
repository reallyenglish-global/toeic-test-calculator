module TOEICTestCalculator
  class LinearScaleScore
    class OutsideRangeError < StandardError; end

    def initialize(percentage, opts)
      @percentage = percentage
      @low_score_threshold = opts.fetch(:low_score_threshold)
      @high_score_threshold = opts.fetch(:high_score_threshold)
      @min_scaled_score = opts.fetch(:min_scaled_score)
      @max_scaled_score = opts.fetch(:max_scaled_score)

      validate
    end

    def calculate
      f = Rational(max_scaled_score - min_scaled_score, high_score_threshold-low_score_threshold)
      (min_scaled_score + (percentage - low_score_threshold)*f)
    end

    private
    attr_reader :low_score_threshold, :high_score_threshold, :percentage, :min_scaled_score, :max_scaled_score

    def validate
      if percentage < low_score_threshold || percentage > high_score_threshold
        fail OutsideRangeError.new(message: 'Score is outside of range for linear scale')
      end
    end
  end
end
