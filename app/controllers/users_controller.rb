class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render "/user_templates/index.html.erb"
  end

  def show
    puts params.inspect # Add this line to print the value of params
    user_id = params.fetch(:username)
    matching_usersnames = User.find_by(id: user_id)

    @the_user = matching_usersnames
    @owner = matching_usersnames.username

    render "/user_templates/show.html.erb"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :private)
  end
end

class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.build
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.build(photo_params)

    if @photo.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to user_path(@photo.owner)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @user = @photo.owner
    @photo.destroy

    redirect_to user_path(@user)
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
