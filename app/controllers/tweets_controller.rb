class TweetsController < ApplicationController
  def index
    timeLine_user_ids = current_user.following.ids << current_user.id
    @tweets = Tweet.where(user_id: timeLine_user_ids).order('created_at DESC')
    @users = User.where.not(id: current_user.following.ids)
  end

  def create
    binding.pry
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, images_attributes: [:file])
  end

end
