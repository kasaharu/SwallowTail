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
          when 'こんにちは'
              message['text'] = greet(client, event['source']['userId'])
          else
            return
          end
          response = client.reply_message(event['replyToken'], message)
          p response.body
        end
      end
    end
  end

  def fetch_weather
    response = Weather.fetch

    if response.code == '200'
      return Weather.parse_msg(response.body)
    else
      return Weather.error_msg(response)
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

  def greet(client, userId)
    resProfile = client.get_profile(userId)
    case resProfile
    when Net::HTTPSuccess then
      contact = JSON.parse(resProfile.body)
      p contact['displayName'] + contact['pictureUrl'] + contact['statusMessage']
      return "#{contact['displayName']}さん こんにちは♪"
    else
      return "#{resProfile.code} #{resProfile.body}"
    end
  end

end
