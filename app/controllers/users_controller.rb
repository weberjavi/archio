class UsersController < ApplicationController
before_action :authenticate_user!
def show
  @project = Project.new
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
