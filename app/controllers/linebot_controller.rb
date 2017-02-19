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

    events = client.parse_events_from(request.body.read)

    response = client.reply_message(events[0]['replyToken'], message)
    p response
  end
end
