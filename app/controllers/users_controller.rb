class UsersController < ApplicationController
  def index
    @users = User.order(:username)
    render "/user_templates/index.html.erb"
  end

  def show
    @user = User.find(params[:id])
    render "/user_templates/show.html.erb"
  end

  def new
    @user = User.new
    render "/user_templates/index.html.erb"
  end
end
