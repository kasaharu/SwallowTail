class KeywordRepliesController < ApplicationController
  def index
    @keyword_replies = KeywordReply.all
  end

  def show
    @keyword_reply = KeywordReply.find(params[:id])
  end
end
