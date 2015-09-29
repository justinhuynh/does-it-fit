class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @users = User.all
  end

  protected

  def authorize_admin
    unless current_user.admin?
      flash[:error] = "You are not authorized to view this page"
      redirect_to root_path
    end
  end
end
