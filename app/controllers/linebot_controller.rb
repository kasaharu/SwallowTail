require 'line/bot'
require 'net/http'
require 'uri'
require 'rexml/document'

class LinebotController < ApplicationController
  protect_from_forgery :except => ["callback"]

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
          keyword_reply = KeywordReply.fetch(event['message']['text'])
          if !keyword_reply.nil?
            message['text'] = keyword_reply.reply_word
          elsif event['message']['text'].include?("とは")
            target_word = event['message']['text'].sub(/とは/, "")
            message['text'] = search_word(target_word)
          elsif event['message']['text'].include?(ENV["BOT_NAME"])
            target_word = event['message']['text'].sub(ENV["BOT_NAME"], "")
            message['text'] = talk_bot(target_word)
          else
            case event['message']['text']
            when '天気'
              message['text'] = fetch_weather
            when 'アニメ一覧'
              target_season = DateUtil.detect_target_season
              message['text'] = fetch_anime(target_season)
            when 'こんにちは'
                message['text'] = greet(client, event['source']['userId'])
            else
              return
            end
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

  def fetch_anime(target_season)
    response = Annict.fetch(target_season)
    if response.code == '200'
      return Annict.parse_msg(response.body)
    else
      return Annict.error_msg(response)
    end
  end

  def talk_bot(message)
    response = A3rt.talk(message)
    body = JSON.parse(response.body)
    if body["status"] == 0
      return body["results"][0]["reply"]
    else
      return body["message"]
    end
  end

  def search_word(target_word)
    uri_path = "http://wikipedia.simpleapi.net/api?keyword=#{target_word}&output=json"
    response = NetUtil.http_request(uri_path, false)
    if response.code == '200'
      content = JSON.parse(response.body)
      result  = "【#{ content[0]['title']}】\n"
      result += content[0]['body']
    else
      puts 'ERROR'
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
