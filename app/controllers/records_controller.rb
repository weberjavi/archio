class RecordsController < ApplicationController
  layout "logged_in_layout"

  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]
  before_action :user_belongs_to_project
  
  def index
    @project = Project.find_by(id: params[:project_id])
    @records_index = @project.contexts.all
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
