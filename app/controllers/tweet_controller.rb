class TweetController < ApplicationController
  def input
  end

  def update
    if signed_in?

      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = session[:oauth_token]
        config.access_token_secret = session[:oauth_token_secret]
      end
      # client = Twitter::Client.new(
      #   :oauth_token => session[:oauth_token],
      #   :oauth_token_secret => session[:oauth_token_secret]
      # )
      client.update(params[:message])
      @result = :success
    else
      @result = :not_signed_in
    end
  end
end