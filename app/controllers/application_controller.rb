class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_tweet
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_identifier, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :header_image])
  end

  def set_tweet
    @tweet = Tweet.new
    @tweet.images.build
  end

end
