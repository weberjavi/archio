class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def show
    @project = Project.find_by(id: params[:id])
    @role = Role.find_by(resource_id: @project.id)
    @admin = User.find_by(id: @role.user_id)
  end

  def create
    @user_id = current_user.id
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project created correctly"
      current_user.add_role :admin, @project
      @role = Role.find_by(resource_id: @project.id)
      "binding pry"
      @role.user_id = @user_id
      redirect_to project_path(@project.id)
    else
      flash[:alert] = "You have some errors:"
    end

    
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :resource_id)
  end
end
