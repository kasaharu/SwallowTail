class Annict < ApplicationRecord
  def self.fetch
    uri = URI.parse("https://api.annict.com/v1/works?fields=title&per_page=50&filter_season=2017-winter&sort_watchers_count=desc&access_token=#{ENV["ANNICT_ACCESS_TOKEN"]}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    return http.start {
      http.get(uri.request_uri)
    }
  end

  def self.parse_msg(body)
    result = JSON.parse(body)
    anime_list = ''
    result['works'].each do |item|
      anime_list += "#{item['title']} \n"
    end
    return anime_list
  end

  def self.error_msg(res)
    return "[#{response.code}] アニメ情報のの取得に失敗しました #{response.message}"
  end
end
