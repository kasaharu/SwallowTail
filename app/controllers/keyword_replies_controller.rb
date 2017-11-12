class KeywordRepliesController < ApplicationController
  before_filter :basic_auth

  def index
    @keyword_replies = KeywordReply.all
  end

  def show
    @keyword_reply = KeywordReply.find(params[:id])
  end

  def new
    @keyword_reply = KeywordReply.new
  end

  def edit
    @keyword_reply = KeywordReply.find(params[:id])
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

  def update
    @keyword_reply = KeywordReply.find(params[:id])
    respond_to do |format|
      if @keyword_reply.update(keyword_reply_params)
        format.html { redirect_to @keyword_reply, notice: 'KeywordReply was successfully updated.' }
        format.json { render :show, status: :created, location: @keyword_reply }
      else
        format.html { render :new }
        format.json { render json: @keyword_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keyword_reply = KeywordReply.find(params[:id])
    @keyword_reply.destroy
    respond_to do |format|
      format.html { redirect_to keyword_replies_url, notice: 'KeywordReply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_AUTH_USER'] && pass == ENV['BASIC_AUTH_PASS']
    end
  end

  def keyword_reply_params
    params.require(:keyword_reply).permit(:keyword, :reply_type, :reply_word)
  end
end
