module Twinkle
  module Client
    class DefaultFormatter
      @backtrace_num_lines = 3

      class << self
        attr_accessor :backtrace_num_lines

        def call(message, options = {})
          formatted_message = message.message if message.respond_to?(:message)
          formatted_message ||= message.to_s

          if message.respond_to?(:backtrace)
            formatted_message << "\n#{message.backtrace.take(@backtrace_num_lines).join("\n")}"
          end

          if tags = options[:hashtags]
            formatted_message << "\n#{tags.join(" ")}"
          end

          formatted_message
        end
      end
    end
  end
end
