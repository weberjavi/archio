class UsersController < ApplicationController
  layout "logged_in_layout"

before_action :authenticate_user!
def show
  @user = current_user
  @projects = current_user.projects
  @project = Project.new
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
