class KeywordRepliesController < ApplicationController
  def index
    @keyword_replies = KeywordReply.all
  end
end
