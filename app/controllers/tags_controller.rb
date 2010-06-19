class TagsController < ApplicationController
  before_filter :flickr_authorize
  
  def show
    @photo = flickr.photos.getInfo :photo_id => params[:id], :auth => session[:flickr_auth_token]
  end
  
  def update
    tags = []
    tags << "soil:pH=%1f" % params[:ph] if params[:ph]
    tags << "soil:texture=#{URI.escape(params[:texture])}" if params[:texture]
    tags << "soil:colour=#{URI.escape(params[:colour])}" if params[:colour]
    flickr.photos.setTags :photo_id => params[:id], :tags => tags.join(" "), :auth => session[:flickr_auth_token]
    redirect_to tag_path(params[:id])
  end
  
  protected
  
  def flickr_authorize
    redirect_to authorize_path unless session[:flickr_auth_token]
  end
end
