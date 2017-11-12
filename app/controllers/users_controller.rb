class UsersController < ApplicationController

  before_action :set_unfollowings
  before_action :set_user,  only: [:following, :followers]

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at DESC')
  end

  def following
    @followings = User.where(id: @user.following.ids)
  end

  def followers
    @followers = User.where(id: @user.followers.ids)
  end

  def set_user
    @user = User.find(params[:format])
  end

  def set_unfollowings
    @users = User.where.not(id: current_user.following.ids)
  end
end
