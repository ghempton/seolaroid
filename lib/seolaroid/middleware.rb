require "rest-client"

module Seolaroid
  class Middleware
    attr_accessor :driver

    def initialize(app, opts={})
      @opts = default_options.merge(opts)
      @app = app
    end

    def default_options
      {
        server_url: 'http://127.0.0.1:9292'
      }
    end

    def call(env)
      if is_bot?(env)
        return proxy_request(env)
      end

      @app.call(env)
    end

    def is_bot?(env)
      env['HTTP_USER_AGENT'] == 'googlebot'
    end

    def proxy_request(env)
      url = request_uri(env)
      RestClient.get @opts[:server_url], params: {url: url} do |response, request, result|
        #:content_length
        headers = [:content_type].inject({}) {|hash, key| hash[key] = response.headers[key]; hash}
        return [response.code, {}, [response.body]]
      end
    end

    def request_uri(env)
      env["REQUEST_URI"] || "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['PATH_INFO']}"
    end
  end
end