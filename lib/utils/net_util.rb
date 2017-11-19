require 'net/http'
require 'uri'

class NetUtil
  def self.http_request(uri_path, use_ssl)
    escaped_uri = URI.escape(uri_path)
    uri         = URI.parse(escaped_uri)
    http        = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true if use_ssl

    http.start do
      http.get(uri.request_uri)
    end
  end

  def self.post_request(uri_path, query_string)
    escaped_uri = URI.escape(uri_path)
    uri         = URI.parse(escaped_uri)
    https       = Net::HTTP.new(uri.host, uri.port)

    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data(query_string) if query_string

    https.request(req)
  end
end
