require 'line/bot'
require 'net/http'
require 'uri'

class LinebotController < ApplicationController
  def callback
    message = {
      type: 'text',
      text: 'Hello, This is LINE bot'
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    puts events = client.parse_events_from(request.body.read)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          case event['message']['text']
          when '天気'
            message['text'] = fetch_weather
          when 'アニメ一覧'
            message['text'] = fetch_anime_now
          end
          response = client.reply_message(event['replyToken'], message)
          p response.body
        end
      end
    end
  end

  def fetch_weather
    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    http = Net::HTTP.new(uri.host, uri.port)
    res = http.start {
      http.get(uri.request_uri)
    }
    if res.code == '200'
      result = JSON.parse(res.body)
      puts result['title']
      puts result['description']['text']
      return result['title'] + "\n\n" + result['description']['text']
    else
      return "天気の取得に失敗しました #{res.code} #{res.message}"
    end
  end

  def fetch_anime_now
    uri = URI.parse("https://api.annict.com/v1/works?fields=title&per_page=50&filter_season=2017-winter&sort_watchers_count=desc&access_token=#{ENV["ANNICT_ACCESS_TOKEN"]}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.start {
      http.get(uri.request_uri)
    }
    if res.code == '200'
      result = JSON.parse(res.body)
      anime_list = ''
      result['works'].each do |item|
        anime_list += "#{item['title']} \n"
      end
      return anime_list
    else
      return "アニメ情報の取得に失敗しました #{res.code} #{res.message}"
    end
  end


end
