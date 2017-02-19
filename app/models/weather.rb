class Weather < ApplicationRecord
  def self.fetch
    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    http = Net::HTTP.new(uri.host, uri.port)
    return http.start {
      http.get(uri.request_uri)
    }
  end

  def self.parse_msg(body)
    result = JSON.parse(body)
    forecastList = result['forecasts']
    temperatureInfo = "\n----------\n"
    forecastList.each do |forecast|
      temperatureInfo += "#{forecast['date']}(#{forecast['dateLabel']})"
      temperatureInfo += "  天気 : #{forecast['telop']}\n"
      temperatureInfo += "  気温 : 最高気温 #{forecast['temperature']['max']['celsius']}℃"   if forecast['temperature']['max']
      temperatureInfo += " / " + " 最低気温 #{forecast['temperature']['min']['celsius']}℃\n" if forecast['temperature']['min']
    end
    description = result['description']['text'].split((/\s*【東京地方】\s*/))
    return result['title'] + "\n\n " + description[1] + temperatureInfo
  end

  def self.error_msg(res)
    return "[#{response.code}] 天気の取得に失敗しました #{response.message}"
  end
end
