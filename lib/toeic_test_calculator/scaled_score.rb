module TOEICTestCalculator
  class ScaledScore
    attr_reader :score, :range, :text

    def initialize(rational_score)
      @score = round_5(rational_score)
      #@range = range.join('-'s
      #@test = test.to_s
    end

    private

    def round_5(rational)
      (rational*2).round(-1)/2
    end
  end
end
