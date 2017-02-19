class Annict < ApplicationRecord
  def self.get_season(month)
    case month
    when 1..3
      return 'winter'
    when 4..6
      return 'spring'
    when 7..9
      return 'summer'
    when 10..12
      return 'autumn'
    end
  end

  def self.detect_target_season
    today = Date.today
    this_year = today.year
    this_month = today.mon
    this_season = self.get_season(this_month)
    return "#{this_year}-#{this_season}"
  end

  def self.fetch(target_season)
    uri = URI.parse("https://api.annict.com/v1/works?fields=title&per_page=50&filter_season=#{target_season}&sort_watchers_count=desc&access_token=#{ENV["ANNICT_ACCESS_TOKEN"]}")
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
