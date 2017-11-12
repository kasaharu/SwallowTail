class A3rt < ApplicationRecord
  def self.talk(message)
    uri_path = 'https://api.a3rt.recruit-tech.co.jp/talk/v1/smalltalk'
    query_string = {'apikey' => ENV['A3RT_API_KEY'], 'query' => message}

    NetUtil.post_request(uri_path, query_string)
  end
end
