class KeywordRepliesController < ApplicationController
  def index
    @keyword_replies = KeywordReply.all
  end

  def show
    @keyword_reply = KeywordReply.find(params[:id])
  end

  def new
    @keyword_reply = KeywordReply.new
  end

  def create
    @keyword_reply = KeywordReply.new(keyword_reply_params)

    respond_to do |format|
      if @keyword_reply.save
        format.html { redirect_to @keyword_reply, notice: 'KeywordReply was successfully created.' }
        format.json { render :show, status: :created, location: @keyword_reply }
      else
        format.html { render :new }
        format.json { render json: @keyword_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def keyword_reply_params
    params.require(:keyword_reply).permit(:keyword, :reply_type, :reply_word)
  end
end
