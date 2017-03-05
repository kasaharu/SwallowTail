class KeywordRepliesController < ApplicationController
  def index
    @keyword_replies = KeywordReply.all
  end

  def show
    @keyword_reply = KeywordReply.find(params[:id])
  end

  private
  def keyword_reply_params
    params.require(:keyword_reply).permit(:keyword, :reply_type, :reply_word)
  end
end
