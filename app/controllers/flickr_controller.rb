class FlickrController < ApplicationController
  def show
    frob = flickr.auth.getFrob
    @auth_url = FlickRaw.auth_url :frob => frob, :perms => 'write'
  end
  
  def create
    auth = flickr.auth.getToken :frob => params[:frob]
    session[:flickr_auth_token] = auth.token
    session[:flickr_nsid] = auth.user.nsid
    redirect_to root_path
  end
end
