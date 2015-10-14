module TOEICTestCalculator
  class ScoreConversionChart
    # Quick and dirty csv conversion chart for a given test.
    # TODO tidy up and spec.

    def self.csv(test_type)
      test_type = test_type
      puts test_type.to_s
      puts "REscore,TOEIC Score, range"
      (0..50).each do |p|
        p = p*2
        score = TOEICTestCalculator::ScaledScore.new(TOEICTestCalculator.for(p, test_type)).score
        low =TOEICTestCalculator::ScaledScore.new(TOEICTestCalculator.for(p-6, test_type)).score
        high =TOEICTestCalculator::ScaledScore.new(TOEICTestCalculator.for(p+6, test_type)).score
        range = low == high ? high.to_s : "#{low}-#{high}"
        puts "#{p/2},#{score},#{range}"
      end
    end

    private

    attr_reader :test_type
  end
end
