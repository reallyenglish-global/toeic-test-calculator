module TOEICTestCalculator
  #
  # NB do not merge this into master. This branch is a temporary implementation
  # of TOEIC scoring.
  #
  class ScoreDetail
    def initialize(score_detail)
      @scores = score_detail.fetch(:scores)
      process_scores
    end

    def self.hash(score_detail)
      new(score_detail).hash
    end

    def hash
      {
        scores: scores,
        total: {
          scaled_score: total_scaled_score,
          band: band
        }
      }
    end

    def total_scaled_score
      scaled_scores.inject(:+)
    end

    private

    attr_reader :scores

    def process_scores
      scores.each do |score|
        scaled_score = scaled_score_for_score(score.fetch(:score))
        scaled_scores << scaled_score

        score[:scaled_score] = scaled_score
      end
    end

    def scaled_score_for_score(score)
      ((score.to_i*(0.223+9.308))*2).round(-1)/2
    end

    def band
      fetch_band.last
    end

    def fetch_band
      {
        45   => "10-45",
        95  => "50-95",
        145 => "100~145",
        195 => "150-195",
        245 => "200-245",
        295 => "250-295",
        345 => "300-345",
        395 => "350-395",
        445 => "400-445",
        495 => "450-495",
        545 => "500-545",
        595 => "550-595",
        645 => "600-645",
        695 => "650-695",
        745 => "700-745",
        795 => "750-795",
        845 => "800-845",
        895 => "850-895",
        945 => "900-945",
        990 => "950-990"
      }.find {|k,v| k >= total_scaled_score}
    end

    def scaled_scores
      @scaled_scores ||= []
    end
  end
end
