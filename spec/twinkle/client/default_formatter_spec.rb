require "spec_helper"

describe Twinkle::Client::DefaultFormatter do
  context "when message is a String" do
    it "returns as is" do
      expect(described_class.call("message")).to eq "message"
    end
  end

  context "when message like an Exception" do
    context "when only message provided" do
      it "returns only a message" do
        error = double("error", message: "message")
        expect(described_class.call(error)).to eq "message"
      end
    end

    context "when backtrace provided" do
      before { Twinkle::Client.config.formatter.backtrace_num_lines = 2 }
      after { Twinkle::Client.reset }

      it "returns two top rows from backtrace" do
        error = double("error", message: "message", backtrace: ["1", "2", "3", "4"])
        expect(described_class.call(error)).to eq "message\n1\n2"
      end
    end
  end
end
