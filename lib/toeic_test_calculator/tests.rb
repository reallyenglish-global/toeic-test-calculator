module TOEICTestCalculator::Tests
  # Default configuration for TOEIC best fit based on conversion tables.
  # NB We have been asked to use a linear scale from 0-100% for both
  # reading and listening, however this has yet to be confirmed so will be
  # using these defaults until that has been agreed.
  #
  # TODO at range when determined.

  def self.min_scaled_score
    5
  end

  def self.max_scaled_score
    495
  end

  module Reading
    def self.low_score_threshold
      21
    end

    def self.high_score_threshold
      100
    end
  end

  module Listening
    def self.low_score_threshold
      17
    end

    def self.high_score_threshold
      93
    end
  end
end
