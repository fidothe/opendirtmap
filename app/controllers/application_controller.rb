class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  def authorized_user?
    !session[:flickr_auth_token].blank?
  end
  helper_method :authorized_user?
end
