require "curb"
require "twinkle/client/version"
require "twinkle/client/default_formatter"

module Twinkle
  module Client
    Config = Struct.new(:endpoint, :token, :formatter)

    def self.config
      @config ||= Config.new.tap do |config|
        config.formatter = ::Twinkle::Client::DefaultFormatter
      end
    end

    def self.configure
      yield config
    end

    def self.reset
      @resources = nil
      @config = nil
    end

    # Send a message
    #
    # channel - String The name of channel
    # message - String|Exception A text message or failure object
    # options - Hash
    #           :formatter - Proc A formatter block (default: :simple)
    def self.create_message(channel, message, options = {})
      formatter = options.fetch(:formatter, config.formatter)
      message = formatter.call(message)

      post "/messages", channel: channel, message: message
    end

    private

    def self.post(path, params = {})
      add_default_params(params)
      Curl.post(resource(path), params).body_str
    end

    def self.add_default_params(params)
      params[:token] ||= config.token
    end

    def self.resource(path)
      @resources ||= Hash.new({})
      @resources[config.endpoint][path] ||= File.join(config.endpoint, path)
    end
  end
end
