class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.posts.destroy_all
    if user.destroy
      flash[:success] = 'User deleted successfully'
      redirect_to users_path
    else
      flash.now[:error] = 'Error: User could not be deleted'
      redirect_to user_path(user)
    end
  end
end
