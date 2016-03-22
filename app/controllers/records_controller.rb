class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]
  before_action :user_belongs_to_project

  def new
    
  end

  def index
    @skeleton_sheet = SkeletonSheet.new
    @user_id = params[:user_id]
    @project = Project.find_by(id: params[:project_id])
    @context = @project.contexts.new    
  end

  private

  def user_belongs_to_project
    @project = Project.find_by(id: params[:project_id])
    @user = current_user
    unless @user.projects.include? @project
      flash[:notice] = "No tiene los permisos necesarios para acceder a este proyecto"
      redirect_to :root
    end
  end

end
