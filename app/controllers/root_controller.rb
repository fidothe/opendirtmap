class RootController < ApplicationController
  respond_to :html, :kml, :rss
  
  def index
    unless authorized_user?
      @geotagged_photos = []

      frob = flickr.auth.getFrob
      @auth_url = FlickRaw.auth_url :frob => frob, :perms => 'write'
    else
      @geotagged_photos = flickr.photos.search :user_id => session[:flickr_nsid], :has_geo => 'true', :per_page => 10, :auth => session[:flickr_auth_token]
    end

  end
  
  def overlay
    @dirt_tagged_photos = flickr.photos.search :machine_tags => "soil:pH=", :extras => "geo,machine_tags,owner_name,path_alias", :per_page => 500, :auth => session[:flickr_auth_token]
  end

end
