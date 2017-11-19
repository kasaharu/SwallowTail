class Annict < ApplicationRecord
  def self.fetch(target_season)
    uri_path = "https://api.annict.com/v1/works?fields=title&per_page=50&filter_season=#{target_season}&sort_watchers_count=desc&access_token=#{ENV['ANNICT_ACCESS_TOKEN']}"
    NetUtil.http_request(uri_path, true)
  end

  def self.parse_msg(body)
    result = JSON.parse(body)
    anime_list = ''
    result['works'].each do |item|
      anime_list += "#{item['title']} \n"
    end
    anime_list
  end

  def self.error_msg(res)
    "[#{response.code}] アニメ情報のの取得に失敗しました #{response.message}"
  end
end
