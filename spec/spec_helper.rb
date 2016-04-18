$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "simplecov"
SimpleCov.start do
  minimum_coverage 95
end

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'twinkle/client'
require 'webmock/rspec'
