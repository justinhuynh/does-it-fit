class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:index, :destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User was successfully deleted"
      redirect_to users_path
    end
  end

  def show
    @user = User.find(current_user)
  end

  protected

  def authorize_admin
    unless current_user.admin?
      flash[:error] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end
