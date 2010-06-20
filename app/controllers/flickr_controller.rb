class FlickrController < ApplicationController
  def logout
    session[:flickr_auth_token] = nil
    session[:flickr_nsid] = nil
    redirect_to root_path
  end
  
  def create
    auth = flickr.auth.getToken :frob => params[:frob]
    session[:flickr_auth_token] = auth.token
    session[:flickr_nsid] = auth.user.nsid
    redirect_to root_path
  end
end
