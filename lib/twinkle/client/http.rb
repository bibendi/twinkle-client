require "net/http"
require "uri"

module Twinkle
  module Client
    class Http
      def initialize(endpoint, token)
        @token = token

        endpoint = ::URI.parse(endpoint).normalize
        @transport = ::Net::HTTP.new(endpoint.host, endpoint.port).tap do |http|
          http.open_timeout = 20
          http.read_timeout = 20
        end
      end

      def post(path, params = {})
        set_default_params(params)
        request = ::Net::HTTP::Post.new(path)
        request.set_form_data(params)
        @transport.request(request).kind_of?(::Net::HTTPSuccess)
      end

      private

      def set_default_params(params)
        params[:token] ||= @token
      end
    end
  end
end
