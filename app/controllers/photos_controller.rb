class PhotosController < ApplicationController
  def index
    @photos = Photo.order(:owner)

    render "/photos_templates/index.html.erb"
  end

  def show
    @photo = Photo.where(params[:id])
    render "/photos_templates/show.html.erb"
  end
end
