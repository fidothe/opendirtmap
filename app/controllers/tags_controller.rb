class TagsController < ApplicationController
  before_filter :flickr_authorize
  
  def show
    @photo = flickr.photos.getInfo :photo_id => params[:id], :auth => session[:flickr_auth_token]
  end
  
  def update
    tags = ['opendirtmap:tagged']
    tags << "soil:pH=%1.2f" % params[:ph] if params[:ph]
    tags << "soil:texture=#{params[:texture]}" if params[:texture]
    tags << "soil:colour=#{params[:colour]}" if params[:colour]
    flickr.photos.setTags :photo_id => params[:id], :tags => tags.join(", "), :auth => session[:flickr_auth_token]
    redirect_to tag_path(params[:id])
  end
  
  protected
  
  def flickr_authorize
    redirect_to authorize_path unless session[:flickr_auth_token]
  end
end
