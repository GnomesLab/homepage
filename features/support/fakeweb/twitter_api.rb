# encoding: UTF-8

# Monkey patch the Grackle module in order to cache the calls to Twitter API
module Grackle

  # Save the last response body in the last_response_body variable
  class Client
    attr_reader :last_response_body

    protected
      alias_method :process_response_original, :process_response

      def process_response(format, res)
        @last_response_body = res.body
        process_response_original(format, res)
      end
  end

  # Save the last requested url in the last_url variable
  class Transport
    attr_reader :last_url
    alias_method :request_original, :request

    def request(method, string_url, options={})
      @last_url = string_url
      request_original(method, string_url, options)
    end
  end
end

# Make a call to the Twitter API in the same way that latest tweets partial does
TwitterProxy.instance.get_tweets

# Use FakeWeb to cache the request to the Twitter API
FakeWeb.register_uri(:get,
                     TwitterProxy.instance.instance_variable_get(:@grackle).send(:transport).last_url,
                     :status => ['200', 'OK'],
                     :body => TwitterProxy.instance.instance_variable_get(:@grackle).last_response_body)
