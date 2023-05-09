class UsersController < ApplicationController
  def index
    @list_of_users = User.order(username: :asc)
    render "/user_templates/index.html.erb"
  end

  def show
    @the_user = User.find_by(username: params[:username])
    render "/user_templates/show.html.erb"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])

    if @user.update(user_params)
      redirect_to user_path(@user.username)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(username: params[:username])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :private)
  end
end
