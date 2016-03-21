class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]

  def new
    @user = User.find_by(id: params[:user_id])
    @project = Project.new
    @projects = current_user.projects
  end
  def show
    @users = User.all
    @project = Project.find_by(id: params[:id])
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project created correctly"
      @project.users << @user
      @user.add_role :admin, @project
      redirect_to user_project_path(@user.id, @project.id)
    else
      flash[:alert] = "You have some errors:"
    end  
  end
  def index 
    @projects = current_user.projects
  end
 

  private

  def add_user_to_project
    @user = params[:new_user]
  end

  def project_params
    params.require(:project).permit(:name, :description, :resource_id, :user_id)
  end
end
