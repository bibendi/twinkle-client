require "twinkle/client/version"
require "twinkle/client/http"
require "twinkle/client/default_formatter"

module Twinkle
  module Client
    Config = Struct.new(:endpoint, :token, :formatter)

    def self.config
      @config ||= Config.new.tap do |config|
        config.formatter = ::Twinkle::Client::DefaultFormatter
      end
    end

    def self.http
      @http ||= Http.new(config.endpoint, config.token)
    end

    def self.configure
      yield config
    end

    def self.reset
      @config = nil
      @http = nil
    end

    # Send a message
    #
    # channel - String The name of channel
    # message - String|Exception A text message or failure object
    # options - Hash
    #           :formatter - Proc A formatter block (default: :simple)
    #           :hashtags  - Array A message hashtags words started with # (optional)
    def self.create_message(channel, message, options = {})
      formatter = options.fetch(:formatter, config.formatter)
      message = formatter.call(message, options)

      http.post "/messages", channel: channel, message: message
    end
  end
end
