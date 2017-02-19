require 'line/bot'

class LinebotController < ApplicationController
  def callback
    message = {
      type: 'text',
      text: 'hello, LINE bot'
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
          response = client.reply_message(event['replyToken'], message)
          p response.body
        end
      end
    end
  end
end
