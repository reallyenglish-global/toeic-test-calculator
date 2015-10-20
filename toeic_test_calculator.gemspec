Gem::Specification.new do |s|
  s.name        = 'toeic-test-calculator'
  s.version     = '0.1.1'
  s.date        = '2015-10-02'
  s.summary     = "Computes TOEIC Test score."
  s.description = "Takes a TOEIC Test percentage an converts it into a TOEIC Test score for reading an listening tests."
  s.authors     = ["Tim Peat"]
  s.email       = 'timp@reallyenglish.com'
  s.files       = ["lib/toeic_test_calculator.rb"]
  s.add_development_dependency "rspec"
end
