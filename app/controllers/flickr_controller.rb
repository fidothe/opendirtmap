class FlickrController < ApplicationController
  def show
    frob = flickr.auth.getFrob
    @auth_url = FlickRaw.auth_url :frob => frob, :perms => 'write'
  end
  
  def create
    
  end
end
