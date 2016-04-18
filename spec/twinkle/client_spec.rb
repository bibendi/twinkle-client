require "spec_helper"

describe Twinkle::Client do
  before do
    described_class.configure do |c|
      c.endpoint = "http://example.com"
      c.token = "token"
    end
  end

  after { described_class.reset }

  describe ".configure" do
    it "yields a config object" do
      expect { |b| described_class.configure(&b) }.to yield_with_args(Twinkle::Client::Config)
    end

    it "sets default params" do
      described_class.configure do |config|
        expect(config.formatter).to be Twinkle::Client::DefaultFormatter
      end
    end
  end

  describe ".create_message" do
    it "sends a message" do
      stub_request(:post, "http://example.com/messages").
        with(:body => "channel=channel&message=message&token=token")

      described_class.create_message("channel", "message")
    end

    it "uses a custom message formatter" do
      stub_request(:post, "http://example.com/messages").
        with(:body => "channel=channel&message=formatted-message&token=token")

      described_class.create_message("channel", "message", formatter: ->(message) { "formatted-#{message}" })
    end

    it "uses a formatter from config" do
      stub_request(:post, "http://example.com/messages").
        with(:body => "channel=channel&message=formatted-message&token=token")

      described_class.configure do |c|
        c.formatter = ->(message) { "formatted-#{message}" }
      end

      described_class.create_message("channel", "message", formatter: ->(message) { "formatted-#{message}" })
    end
  end
end
