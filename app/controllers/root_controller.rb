class RootController < ApplicationController
  def index
    unless session[:flickr_auth_token]
      @geotagged_photos = []
    else
      @geotagged_photos = flickr.photos.search :user_id => session[:flickr_nsid], :has_geo => 'true', :auth => session[:flickr_auth_token], :per_page => 10
    end
  end
end
