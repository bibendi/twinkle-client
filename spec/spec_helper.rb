$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "simplecov"
SimpleCov.start do
  minimum_coverage 95
end

require 'twinkle/client'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: "codeclimate.com")
