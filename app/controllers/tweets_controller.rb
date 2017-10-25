class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
