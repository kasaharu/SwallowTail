class Weather < ApplicationRecord
  def self.fetch
    uri_path = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'
    return NetUtil.http_request(uri_path, false)
  end

  def self.parse_msg(body)
    result = JSON.parse(body)
    forecastList = result['forecasts']
    temperatureInfo = "\n----------\n"
    forecastList.each do |forecast|
      temperatureInfo += "#{forecast['date']}(#{forecast['dateLabel']})"
      temperatureInfo += "    天気 : #{forecast['telop']}\n"
      temperatureInfo += "    気温 : 最高気温 #{forecast['temperature']['max']['celsius']}℃" if forecast['temperature']['max']
      temperatureInfo += ' / ' + " 最低気温 #{forecast['temperature']['min']['celsius']}℃" if forecast['temperature']['min']
      temperatureInfo += "\n"
    end
    description = result['description']['text'].split((/\s*【東京地方】\s*/))
    return result['title'] + "\n\n " + description[1] + temperatureInfo
  end

  def self.error_msg(res)
    return "[#{response.code}] 天気の取得に失敗しました #{response.message}"
  end
end
