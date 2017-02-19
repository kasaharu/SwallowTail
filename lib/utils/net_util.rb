require 'net/http'
require 'uri'

class NetUtil
  def self.http_request(uri_path, use_ssl)
    escaped_uri = URI.escape(uri_path)
    uri         = URI.parse(escaped_uri)
    http        = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true if use_ssl

    return http.start {
      http.get(uri.request_uri)
    }
  end
end
