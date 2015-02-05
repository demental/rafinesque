require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'minitest/autorun'

require 'rafinesque'

begin
  require 'byebug'
rescue LoadError
  # If you want to debug, gem install byebug
end

Rafinesque::setup
