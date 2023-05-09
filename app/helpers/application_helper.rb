module ApplicationHelper
  def show
    @photo = Photo.find(params[:id])
    @owner_name = photo_owner_name(@photo)
  end
end
