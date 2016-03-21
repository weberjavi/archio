class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]

  def new
    @user = User.find_by(id: params[:user_id])
    @project = Project.new
    @projects = current_user.projects.all
  end
  def show
    @users = User.all
    @project = Project.find_by(id: params[:id])
    @role = Role.find_by(resource_id: @project.id)
    @admin = User.find_by(id: @role.user_id)
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project created correctly"
      @user.add_role :admin, @project
      @role = Role.find_by(resource_id: @project.id)
      @role.user_id = @user_id
      redirect_to project_path(@project.id)
    else
      flash[:alert] = "You have some errors:"
    end  
  end
  def index 
    @projects = current_user.projects
  end
  def add_user_to_project
    
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :resource_id, :user_id)
  end
end
