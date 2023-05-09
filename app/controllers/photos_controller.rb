class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render "photos_templates/index.html.erb"
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :owner_id)
  end

  def show
    @photo = Photo.find(params[:id])
    @owner = @photo.owner.username
    render "photos_templates/show.html.erb"
  end

  def new
    @photo = Photo.new
    @users = User.all
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      @users = User.all
      render "new"
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @users = User.all
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      @users = User.all
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end
end
